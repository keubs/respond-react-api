from .models import Topic
from .serializers import TopicSerializer

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

        payload = {
            'id' : serialized_topic.data['id'],
            'title' : serialized_topic.data['title'],
            'article_link' : serialized_topic.data['article_link'],
            'created_on' : serialized_topic.data['created_on'],
            'score' : score,
            'created_by' : serialized_topic.data['created_by']
        }

        return Response(payload)


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