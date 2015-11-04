from .models import Topic, Action
from .serializers import TopicSerializer, ActionSerializer

from django.http import Http404

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt import utils
from operator import itemgetter

from pprint import pprint
class TopicList(APIView):

    def get(self, request, format=None):

        # rewrite payload to include 'score' value
        topics = Topic.objects.all()
        payload = []
        for topic in topics:
            score = topic.rating_likes - topic.rating_dislikes
            content = {
                'id' : topic.id,
                'title' : topic.title,
                'article_link' : topic.article_link,
                'created_on' : topic.created_on,
                'score' : score,
                'created_by' : topic.created_by,
                'rating_likes' : topic.rating_likes,
                'rating_dislikes' : topic.rating_dislikes,
                'tags' : topic.tags,
            }
            payload.append(content)

        # sort by score instead
        # @TODO score should probably be returned in the model, and thus sorted on a db-level
        if request.query_params.get('order_by') == 'score':
            payload = sorted(payload, key=itemgetter('score'), reverse=True)
        serialized_topics = TopicSerializer(payload, many=True)
        return Response(serialized_topics.data)

class TopicDetail(APIView):

    def get_object(self, pk):
        try:
            topics = Topic.objects.get(pk=pk)
            return topics

        except Topic.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        topic = self.get_object(pk)
        score = topic.rating_likes - topic.rating_dislikes

        serialized_topic = TopicSerializer(topic)
        actions = Action.objects.filter(topic_id=pk)

        # Create an empty list and populate with the topic's actions
        actionsPayload = []
        for action in actions:
            score = action.rating_likes - action.rating_dislikes

            # Create empty list and populate with the action's tags
            # @todo gotta be a better way to map this association than an extra query
            tags = []
            for tag in action.tags.names():
                tags.append(tag);

            # Each action is a dict
            content = {
                'id' : action.id,
                'title' : action.title,
                'description' : action.description,
                'article_link' : action.article_link,
                'created_on' : action.created_on,
                'score' : score,
                'topic' : action.topic.title,
                'created_by' : action.created_by.id,
                'rating_likes' : action.rating_likes,
                'rating_dislikes' : action.rating_dislikes,
                'tags' : tags,
            }

            actionsPayload.append(content)

        # Create payload dict for specific topic
        payload = {
            'id' : serialized_topic.data['id'],
            'title' : serialized_topic.data['title'],
            'article_link' : serialized_topic.data['article_link'],
            'created_on' : serialized_topic.data['created_on'],
            'score' : score,
            'created_by' : serialized_topic.data['created_by'],
            'tags' : serialized_topic.data['tags'],
            'actions' : actionsPayload,
        }

        return Response(payload)


class TopicListByTag(APIView):
    def get(self, reuest, tag, format=None):
        topics = Topic.objects.filter(tags__name__in=[tag])
        payload = []
        for topic in topics:
            score = topic.rating_likes - topic.rating_dislikes
            content = {
                'id' : topic.id,
                'title' : topic.title,
                'article_link' : topic.article_link,
                'created_on' : topic.created_on,
                'score' : score,
                'created_by' : topic.created_by,
                'rating_likes' : topic.rating_likes,
                'rating_dislikes' : topic.rating_dislikes,
                'tags' : topic.tags,
            }
            payload.append(content)

        serialized_topics = TopicSerializer(payload, many=True)
        return Response(serialized_topics.data)

class TopicPost(APIView):
    permission_classes = (IsAuthenticated, )
    authentication_classes = (JSONWebTokenAuthentication, )

    def post(self, request, format=None):
        user_id = utils.jwt_decode_handler(request.auth)
        request.data['created_by'] = user_id['user_id']
        serializer = TopicSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
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
            content = {
                'id' : action.id,
                'title' : action.title,
                'description' : action.description,
                'article_link' : action.article_link,
                'created_on' : action.created_on,
                'score' : score,
                'topic' : action.topic,
                'created_by' : action.created_by,
                'rating_likes' : action.rating_likes,
                'rating_dislikes' : action.rating_dislikes,
            }
            payload.append(content)

        # sort by score instead
        # @TODO score should probably be returned in the model, and thus sorted on a db-level
        if request.query_params.get('order_by') == 'score':
            payload = sorted(payload, key=itemgetter('score'), reverse=True)
        serialized_actions = ActionSerializer(payload, many=True)
        return Response(serialized_actions.data)

class ActionDetailByTopic(APIView):

    def get_object(self, pk):
        try:
            actions = Action.objects.get(pk=pk)
            return actions

        except Action.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        action = self.get_object(pk)
        score = action.rating_likes - action.rating_dislikes

        serialized_action = ActionSerializer(action)

        payload = {
            'id' : serialized_action.data['id'],
            'title' : serialized_action.data['title'],
            'description' : serialized_action.data['description'],
            'article_link' : serialized_action.data['article_link'],
            'created_on' : serialized_action.data['created_on'],
            'score' : score,
            'created_by' : serialized_action.data['created_by']
        }

        return Response(payload)

class ActionPost(APIView):
    permission_classes = (IsAuthenticated, )
    authentication_classes = (JSONWebTokenAuthentication, )

    def post(self, request, pk, format=None):
        user_id = utils.jwt_decode_handler(request.auth)
        request.data['created_by'] = user_id['user_id']
        request.data['topic'] = pk
        serializer = ActionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

