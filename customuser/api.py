from .models import CustomUser

from django.shortcuts import get_object_or_404
from .serializers import CustomUserSerializer

from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import detail_route

from topics.models import Topic, Action
from address.models import Locality
class CustomUserViewSet(viewsets.ViewSet):
    def list(self, request):
        queryset = CustomUser.objects.all()
        serializer = CustomUserSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        queryset = CustomUser.objects.all()
        topic_count = Topic.objects.filter(created_by=pk).count()
        action_count = Action.objects.filter(created_by=pk).count()
        user = get_object_or_404(queryset, pk=pk)
        user.topic_count = topic_count
        user.action_count = action_count

        serializer = CustomUserSerializer(user)
        return Response(serializer.data)