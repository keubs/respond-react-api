import re
import urllib
import requests
import urllib.request

from opengraph import opengraph

from annoying.functions import get_object_or_None

from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_jwt import utils

from django.contrib.auth import get_user_model
from django.db import IntegrityError
from django.conf import settings
from .serializers import TagSerializer, UserSerializer

from topics.models import Topic, Action
from taggit.models import Tag
from topics.serializers import TopicSerializer, ActionSerializer


User = get_user_model()


class UserRegistration(APIView):
    def post(self, request, format=None):
        try:
            user = User(email=request.data['email'], username=request.data['username'], password=request.data['password'])

            user.save()

            # Get new user id and return in response
            request.data['id'] = user.id
            serialized_user = UserSerializer(request.data)
            return Response(serialized_user.data, status=status.HTTP_201_CREATED)
        except IntegrityError:
            return Response({'user': 'username or email already in use'}, status=status.HTTP_409_CONFLICT)


class GetUserFromToken(APIView):
    def post(self, request, format=None):
        try:
            user_id = utils.jwt_decode_handler(request.auth)
            return Response(user_id, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": e.args[0]}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class MostPopularTags(APIView):
    def get(self, request):
        query = """
            SELECT tt.id, COUNT(*), tt.slug, tt.name 
                FROM taggit_taggeditem tti 
                INNER JOIN taggit_tag tt 
                    ON tti.tag_id = tt.id 
                WHERE tti.content_type_id = 8 
                GROUP BY tt.slug, tt.name, tt.id
                ORDER BY count(*) DESC 
                LIMIT 10;
            """
        popular_tags = Tag.objects.raw(query)
        serialized_tags = TagSerializer(popular_tags, many=True)

        return Response(serialized_tags.data, status=status.HTTP_200_OK)


class OpenGraphHelpers(APIView):
    def post(self, request, format=None):
        try:
            if request.data['type'] == 'topic':
                topic = Topic.objects.get(article_link=request.data['url'])
                topic_serializer = TopicSerializer(topic)
                return Response(topic_serializer.data, status=status.HTTP_409_CONFLICT)
            else:
                topic = Topic.objects.get(pk=request.data['id'])
                topic_actions = topic.action_set.filter(article_link=request.data['url'])
                action = Action.objects.get(article_link=request.data['url'])
                action_serializer = ActionSerializer(action)

                if topic_actions.count() > 0:
                    return Response(action_serializer.data, status=status.HTTP_409_CONFLICT)

                else:
                    action_topic = Topic.objects.get(pk=action.topic_id)
                    topic_serializer = TopicSerializer(action_topic)
                    return Response(action_serializer.data, status=status.HTTP_200_OK)

        except (Topic.DoesNotExist, Action.DoesNotExist):
            try:
                url = request.data['url']
                og = opengraph.OpenGraph(url)
                tags = getTags(url)

                # Description may or may not exist
                if 'description' in og:
                    desc = og['description']
                else:
                    desc = ''
                if 'title' in og:
                    title = og['title']
                else:
                    title = ''
                if 'image' in og:
                    image = og['image']
                else:
                    image = ''

                if 'url' in og:
                    article_link = og['url']
                else:
                    image = ''

                if 'url' in og:
                    article_link = og['url']
                    # need to check if og.url url exists in DB to help reduce dupes
                    if request.data['type'] == 'topic':
                        topic = get_object_or_None(Topic, article_link=article_link)

                        if topic is not None:
                            return Response(status=status.HTTP_409_CONFLICT)

                    if request.data['type'] == 'action':
                        topic = Topic.objects.get(pk=request.data['id'])
                        action = get_object_or_None(topic.action_set, article_link=article_link, approved=True)

                        if action is not None:
                            return Response(status=status.HTTP_409_CONFLICT)
                else:
                    article_link = ''

                return Response({'image': image, 'title': title, 'description': desc, 'tags': tags, 'article_link': article_link}, status=status.HTTP_200_OK)
            except urllib.error.URLError:
                import sendemail.emails as ev
                email = ev.EmailMessage("noreply@respondreact.com", ['kevin@respondreact.com'])
                email.basic_message('Link Error', 'URL: ' + request.data['url'])
                return Response({'image': 'Invalid URL'}, status=status.HTTP_404_NOT_FOUND)
            except KeyError:
                import sendemail.emails as ev
                email = ev.EmailMessage("noreply@respondreact.com", ['kevin@respondreact.com'])
                email.basic_message('Link Error', 'URL: ' + request.data['url'])
                return Response({'image': 'Not Found'}, status=status.HTTP_404_NOT_FOUND)
            except Exception as e:
                return Response(status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST)


class nyTimesAPIHelpers(APIView):
    def post(self, request, format=None):
        try:
            dictionary = requests.get('http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=web_url:("' + request.data['url'] + '")&api-key=' + settings.NY_TIMES_API_KEY).json()

            if 'response' in dictionary:
                response = dictionary['response']
                if len(response['docs']) == 0:
                    import sendemail.emails as ev
                    email = ev.EmailMessage("noreply@respondreact.com", ['kevin@respondreact.com'])
                    email.basic_message('NY Times Error - Article not found', 'URL: ' + request.data['url'])
                    return Response({'article': 'Not Found'}, status=status.HTTP_404_NOT_FOUND)
                return Response(response)
            else:
                import sendemail.emails as ev
                email = ev.EmailMessage("noreply@respondreact.com", ['kevin@respondreact.com'])
                email.basic_message('NY Times Error.', 'URL: ' + request.data['url'])
                return Response({"error": "invalid data"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        except Exception as e:
            import sendemail.emails as ev
            email = ev.EmailMessage("noreply@respondreact.com", ['kevin@respondreact.com'])
            email.basic_message('NY Times Error', 'URL: ' + request.data['url'] + '\nBODY: ' + str(e))
            return Response({"error": "invalid data"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


def getTags(url):
    from linkfactory.models import Link, LinkType
    links = Link.objects.all()
    tags = []
    linktypes = None
    for link in links:
        if re.search(link.preg, url) is not None:
            linktypes = LinkType.objects.filter(link=link)
            break

    if linktypes is not None:
        tags = [{'text': tag.linktype} for tag in linktypes]
        return tags
