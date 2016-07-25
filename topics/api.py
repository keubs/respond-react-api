from .models import Topic, Action
from .serializers import TopicSerializer, ActionSerializer, TopicDetailSerializer

from django.http import Http404
from django.core.files import File
from django.shortcuts import get_object_or_404
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.parsers import JSONParser, FileUploadParser

from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt import utils
from operator import itemgetter

from misc import views as misc_views
from customuser.models import CustomUser

from address.models import Address, Locality, State, Country
from addressapi.serializers import AddressSerializer

from pprint import pprint

MAX_PAGE_SIZE = 10
class TopicList(APIView):

    def get(self, request, format=None):

        # rewrite payload to include 'score' value
        topics = Topic.objects.all().order_by('-created_on')

        payload = []
        for topic in topics:
            score = topic.rating_likes - topic.rating_dislikes
            user = CustomUser.objects.get(id=int(topic.created_by.id))
            actions = Action.objects.filter(topic=topic.id).count()
            content = {
                'id' : topic.id,
                'title' : topic.title,
                'article_link' : topic.article_link,
                'created_on' : topic.created_on,
                'score' : score,
                'created_by' : topic.created_by,
                'username' : user.username,
                'rating_likes' : topic.rating_likes,
                'rating_dislikes' : topic.rating_dislikes,
                'tags' : topic.tags,
                'image' : topic.image,
                'image_url' : topic.image_url,
                'actions' : actions,
                'scope' : topic.scope,
                'address' : topic.address,
            }

            payload.append(content)

        # sort by score instead
        # @TODO score should probably be returned in the model, and thus sorted on a db-level
        # if request.query_params.get('order_by') == 'score':
        payload = sorted(payload, key=itemgetter('score'), reverse=True)

        paginator = Paginator(payload, MAX_PAGE_SIZE) 
        page = request.GET.get('page')
        try:
            payload = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            payload = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            payload = paginator.page(paginator.num_pages)
        serialized_topics = TopicSerializer(payload, many=True)
        return Response(serialized_topics.data)

class TopicDetail(APIView):

    def get(self, request, pk, format=None):
        try:
            topic = Topic.objects.get(pk=pk)

            score = topic.rating_likes - topic.rating_dislikes

            serialized_topic = TopicDetailSerializer(topic)
            payload = {}
            for attr, value in serialized_topic.data.items():
                payload[attr] = value

            payload['score'] = (serialized_topic['rating_likes'].value - serialized_topic['rating_dislikes'].value)
            try:
                topic_address = Address.objects.get(pk=payload['address'])
                address_serializer = AddressSerializer(topic_address)
                payload['address'] = address_serializer.data
            except Address.DoesNotExist:
                pass
            return Response(payload)

        except Topic.DoesNotExist:
            return Response({"error" : "topic not found"}, status=status.HTTP_404_NOT_FOUND)

class TopicListByTag(APIView):
    def get(self, request, tag, format=None):
        topics = Topic.objects.filter(tags__name__in=[tag])
        payload = []
        for topic in topics:
            score = topic.rating_likes - topic.rating_dislikes
            user = CustomUser.objects.get(id=int(topic.created_by.id))
            content = {
                'id' : topic.id,
                'title' : topic.title,
                'article_link' : topic.article_link,
                'created_on' : topic.created_on,
                'score' : score,
                'created_by' : topic.created_by,
                'username' : user.username,
                'rating_likes' : topic.rating_likes,
                'rating_dislikes' : topic.rating_dislikes,
                'tags' : topic.tags,
                'image': topic.image,
                'image_url': topic.image_url,
                'scope': topic.scope,
                'address' : topic.address,
            }
            payload.append(content)

        serialized_topics = TopicSerializer(payload, many=True)
        return Response(serialized_topics.data)

class TopicPost(APIView):
    permission_classes = (IsAuthenticated, )
    authentication_classes = (JSONWebTokenAuthentication, )

    def post(self, request, format=None):
        user_id = UserIdFromToken(request.auth)
        request.data['created_by'] = user_id

        serializer = TopicSerializer(data=request.data)
        

        if serializer.is_valid():
            model = serializer.save()
            try:
                misc_views.save_image_from_url(model, request.data['image_url'])
            except KeyError:
                Response({'image':'did not save correctly, please retry'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class TopicCount(APIView):
    
    def get(self, request, format=None):
        count = Topic.objects.all().count()
        # count = len(topics)

        return Response({'count': count}, status=status.HTTP_200_OK)

class TopicByScope(APIView):

    def get(self, request, scope, format=None):
        # hardcoded defaults to US and Cali
        country = 5
        state = 2

        if request.auth:
            user_id = UserIdFromToken(request.auth)
            user = CustomUser.objects.get(id=int(user_id))
            address = Address.objects.get(id=user.address_id)

            locality = Locality.objects.get(id=address.locality_id)
            state = State.objects.get(id=locality.state_id)
            country = Country.objects.get(id=state.country_id)
            state = state.id
            country = country.id

        if scope == 'national':
            query = """
                SELECT tt.* FROM topics_topic tt 
                    INNER JOIN address_address aa ON tt.address_id = aa.id 
                    INNER JOIN address_locality al ON aa.locality_id = al.id 
                    INNER JOIN address_state ass ON al.state_id = ass.id 
                    INNER JOIN address_country ac ON ass.country_id = ac.id 
                    WHERE ac.id = {country} 
                    AND tt.scope = 'national'
                    ORDER BY RAND() LIMIT 1
                """.format(country=country)
            for topics in Topic.objects.raw(query):
                    topic_serializer = TopicSerializer(topics)
                    return Response(topic_serializer.data, status=status.HTTP_200_OK)

        elif scope == 'local':
            query = """
                SELECT tt.* FROM topics_topic tt 
                    INNER JOIN address_address aa ON tt.address_id = aa.id 
                    INNER JOIN address_locality al ON aa.locality_id = al.id 
                    INNER JOIN address_state ass ON al.state_id = ass.id
                    WHERE ass.id = {state} 
                    AND tt.scope = 'local'
                    ORDER BY RAND() LIMIT 1
                """.format(state=state)
            for topic in Topic.objects.raw(query):
                    topic_serializer = TopicSerializer(topic)
                    return Response(topic_serializer.data, status=status.HTTP_200_OK)

        elif scope == 'worldwide':
            query = """
            SELECT tt.* FROM topics_topic tt 
                INNER JOIN address_address aa ON tt.address_id = aa.id 
                INNER JOIN address_locality al ON aa.locality_id = al.id 
                INNER JOIN address_state ass ON al.state_id = ass.id 
                INNER JOIN address_country ac ON ass.country_id = ac.id 
                WHERE ac.id <> {country}
                ORDER BY RAND() LIMIT 1
            """.format(country=country)

            for topics in Topic.objects.raw(query):
                    topic_serializer = TopicSerializer(topics)
                    return Response(topic_serializer.data, status=status.HTTP_200_OK)

class ActionListByTag(APIView):
    def get(self, request, tag, format=None):
        actions = Action.objects.filter(tags__name__in=[tag])

        payload = []
        for action in actions:
            score = action.rating_likes - action.rating_dislikes
            user = CustomUser.objects.get(id=int(action.created_by.id))
            content = {
                'id' : action.id,
                'title' : action.title,
                'description' : action.description,
                'article_link' : action.article_link,
                'created_on' : action.created_on,
                'score' : score,
                'topic' : action.topic,
                'username' : user.username,
                'created_by' : action.created_by,
                'rating_likes' : action.rating_likes,
                'rating_dislikes' : action.rating_dislikes,
                'tags' : action.tags,
                'image' : action.image,
                'image_url': action.image_url,
                'address': action.address,
                'scope' : action.scope,
            }
            payload.append(content)

        payload = sorted(payload, key=itemgetter('score'), reverse=True)
        serialized_actions = ActionSerializer(payload, many=True)
        return Response(serialized_actions.data)

class ActionList(APIView):
    def get(self, request, format=None):
        actions = Action.objects.all()
        serialized_actions = ActionSerializer(actions, many=True)
        return Response(serialized_actions.data)

class ActionListByTopic(APIView):
    def get(self, request, pk, format=None):

        # rewrite payload to include 'score' value
        actions = Action.objects.filter(topic_id=pk)

        paginator = Paginator(actions, MAX_PAGE_SIZE) 
        page = request.GET.get('action_page')

        try:
            actions = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            actions = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            actions = paginator.page(paginator.num_pages)

        payload = []
        for action in actions:
            score = action.rating_likes - action.rating_dislikes
            user = CustomUser.objects.get(id=int(action.created_by.id))
            raw = action.address.raw

            content = {
                'id' : action.id,
                'title' : action.title,
                'description' : action.description,
                'article_link' : action.article_link,
                'created_on' : action.created_on,
                'start_date_time' : action.start_date_time,
                'score' : score,
                'topic' : action.topic,
                'username' : user.username,
                'created_by' : action.created_by,
                'rating_likes' : action.rating_likes,
                'rating_dislikes' : action.rating_dislikes,
                'tags' : action.tags,
                'image' : action.image,
                'image_url': action.image_url,
                'action' : action.address,
                'scope' : action.scope,
                'address': action.address,
                'address_raw': raw,
            }
            payload.append(content)

        # sort by score instead
        # @TODO score should probably be returned in the model, and thus sorted on a db-level
        # if request.query_params.get('order_by') == 'score':
        payload = sorted(payload, key=itemgetter('score'), reverse=True)
        serialized_actions = ActionSerializer(payload, many=True)
        return Response(serialized_actions.data)

class ActionDetailByTopic(APIView):
    def get(self, request, pk, fk, format=None):
        action = Action.objects.filter(pk=fk)
        score = action.rating_likes - action.rating_dislikes

        serialized_action = ActionSerializer(action)
        payload = {
            'id' : serialized_action.data['id'],
            'title' : serialized_action.data['title'],
            'description' : serialized_action.data['description'],
            'article_link' : serialized_action.data['article_link'],
            'created_on' : serialized_action.data['created_on'],
            'score' : score,
            'created_by' : serialized_action.data['created_by'],
            'image' : serialized_action.data['image'],
            'tags' : serialized_action.data['tags'],
        }

        return Response(payload)

class ActionPost(APIView):
    permission_classes = (IsAuthenticated, )
    authentication_classes = (JSONWebTokenAuthentication, )

    def post(self, request, format=None):
        user_id = UserIdFromToken(request.auth)

        request.data['created_by'] = user_id

        serializer = ActionSerializer(data=request.data)
        if serializer.is_valid():
            model = serializer.save()
            try:
                misc_views.save_image_from_url(model, request.data['image_url'])
            except KeyError:
                Response({'image':'did not save correctly, please retry'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)




def UserIdFromToken(token):
    user_id = utils.jwt_decode_handler(token)
    user_id = user_id['user_id']

    return user_id

