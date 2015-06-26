from .models import Topic
from .serializers import TopicSerializer

from django.http import Http404

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class TopicList(APIView):
    def get(self, request, format=None):
        topics = Topic.objects.all()
        serialized_topics = TopicSerializer(topics, many=True)
        return Response(serialized_topics.data)

    def post(self, request, format=None):
        serializer = TopicSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=satus.HTTP_400_BAD_REQUEST)

class TopicDetail(APIView):

    def get_object(self, pk):
        try:
            return Topic.object.get(pk=pk)
        except Topic.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        game = self.get_object(pk)
        serialized_topic = TopicSerializer(topic)
        return Response(serialized_topic.data)

