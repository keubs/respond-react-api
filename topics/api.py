from .models import Topic
from .serializers import TopicSerializer

from django.http import Http404

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt import utils
class TopicList(APIView):

    def get(self, request, format=None):
        topics = Topic.objects.all()
        serialized_topics = TopicSerializer(topics, many=True)
        return Response(serialized_topics.data)

class TopicDetail(APIView):

    def get_object(self, pk):
        try:
            return Topic.objects.get(pk=pk)
        except Topic.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        topic = self.get_object(pk)
        serialized_topic = TopicSerializer(topic)
        return Response(serialized_topic.data)


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