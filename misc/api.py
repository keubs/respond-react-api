import re
import urllib
import requests
import urllib.request

from opengraph import opengraph
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response

from rest_framework_jwt import utils

from django.contrib.auth import get_user_model
from django.db import IntegrityError
from django.conf import settings
from .serializers import UserSerializer

from topics.models import Topic, Action
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
                return Response({'image': image, 'title': title, 'description': desc, 'tags': tags}, status=status.HTTP_200_OK)
            except urllib.error.URLError:
                return Response({'image': 'Invalid URL'}, status=status.HTTP_404_NOT_FOUND)
            except KeyError:
                return Response({'image': 'Not Found'}, status=status.HTTP_404_NOT_FOUND)
            # except:
            #     return Response({'response':'Forbidden'}, status=status.HTTP_403_FORBIDDEN)


class nyTimesAPIHelpers(APIView):
    def post(self, request, format=None):
        try:
            dictionary = requests.get('http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=web_url:("' + request.data['url'] + '")&api-key=' + settings.NY_TIMES_API_KEY).json()
            response = dictionary['response']
            return Response(response)
        except KeyError:
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
