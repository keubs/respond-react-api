from .models import Topic, Action
from .serializers import TopicSerializer, ActionSerializer, TopicDetailSerializer

from django.http import Http404
from django.core.files import File
from django.contrib.auth.models import User

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.parsers import JSONParser, FileUploadParser

from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt import utils
from operator import itemgetter

from misc import views as misc_views

from pprint import pprint

class TopicList(APIView):

    def get(self, request, format=None):

        # rewrite payload to include 'score' value
        topics = Topic.objects.all().order_by('-created_on')
        payload = []
        for topic in topics:
            score = topic.rating_likes - topic.rating_dislikes
            user = User.objects.get(id=int(topic.created_by.id))
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
            }
            payload.append(content)


        # sort by score instead
        # @TODO score should probably be returned in the model, and thus sorted on a db-level
        if request.query_params.get('order_by') == 'score':
            payload = sorted(payload, key=itemgetter('score'), reverse=True)
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

            return Response(payload)
        except Topic.DoesNotExist:
            return Response({"error" : "topic not found"}, status=status.HTTP_404_NOT_FOUND)


class TopicListByTag(APIView):
    def get(self, request, tag, format=None):
        topics = Topic.objects.filter(tags__name__in=[tag])
        payload = []
        for topic in topics:
            score = topic.rating_likes - topic.rating_dislikes
            user = User.objects.get(id=int(topic.created_by.id))
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
            }
            payload.append(content)

        serialized_topics = TopicSerializer(payload, many=True)
        return Response(serialized_topics.data)


class ActionListByTag(APIView):
    def get(self, request, tag, format=None):
        actions = Action.objects.filter(tags__name__in=[tag])

        payload = []
        for action in actions:
            pprint(action)
            score = action.rating_likes - action.rating_dislikes
            user = User.objects.get(id=int(action.created_by.id))
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
            }
            payload.append(content)

        payload = sorted(payload, key=itemgetter('score'), reverse=True)
        serialized_actions = ActionSerializer(payload, many=True)
        return Response(serialized_actions.data)

class TopicPost(APIView):
    permission_classes = (IsAuthenticated, )
    authentication_classes = (JSONWebTokenAuthentication, )

    def post(self, request, format=None):
        user_id = utils.jwt_decode_handler(request.auth)
        request.data['created_by'] = user_id['user_id']
        serializer = TopicSerializer(data=request.data)
        if serializer.is_valid():
            model = serializer.save()
            try:
                misc_views.save_image_from_url(model, request.data['image_url'])
            except KeyError:
                Response({'image':'did not save correctly, please retry'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ActionList(APIView):
    def get(self, request, format=None):
        actions = Action.objects.all()
        serialized_actions = ActionSerializer(actions, many=True)
        return Response(serialized_actions.data)

class ActionListByTopic(APIView):
    def get(self, request, pk, format=None):

        # rewrite payload to include 'score' value
        actions = Action.objects.filter(topic_id=pk)

        payload = []
        for action in actions:
            score = action.rating_likes - action.rating_dislikes
            user = User.objects.get(id=int(action.created_by.id))
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
    # permission_classes = (IsAuthenticated, )
    # authentication_classes = (JSONWebTokenAuthentication, )

    def post(self, request, format=None):
        # user_id = utils.jwt_decode_handler(request.auth)
        request.data['created_by'] = 1

        serializer = ActionSerializer(data=request.data)
        if serializer.is_valid():
            model = serializer.save()
            try:
                misc_views.save_image_from_url(model, request.data['image_url'])
            except KeyError:
                Response({'image':'did not save correctly, please retry'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)