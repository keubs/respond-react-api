from .models import CustomUser

from django.shortcuts import get_object_or_404
from .serializers import CustomUserSerializer

from rest_framework import viewsets, status
from rest_framework.response import Response

from rest_framework_jwt import utils
from topics.models import Topic, Action
from updown.models import Vote


class CustomUserViewSet(viewsets.ViewSet):
    def list(self, request):
        queryset = CustomUser.objects.all()
        serializer = CustomUserSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        topic_count = Topic.objects.filter(created_by=pk).count()
        action_count = Action.objects.filter(created_by=pk).count()
        vote_count = Vote.objects.filter(user_id=pk, score=1).count()
        user = get_object_or_404(CustomUser, pk=pk)
        user.topic_count = topic_count
        user.action_count = action_count
        user.vote_count = vote_count
        serializer = CustomUserSerializer(user)
        return Response(serializer.data)

    def update(self, request, pk=None):
        if request.auth is not None:
            user_id = utils.jwt_decode_handler(request.auth)
            user_id = user_id['user_id']
            if user_id == int(pk):

                customuser = CustomUser.objects.get(pk=pk)
                serializer = CustomUserSerializer(customuser, data=request.data, partial=True)
                if serializer.is_valid():
                    serializer.save()
                    return Response(serializer.data, status=status.HTTP_200_OK)
                else:
                    return Response(serializer.data, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response(status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(status=status.HTTP_401_UNAUTHORIZED)
