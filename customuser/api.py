from .models import CustomUser

from django.shortcuts import get_object_or_404
from django.contrib.contenttypes.models import ContentType

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
        me = CustomUser.objects.get(pk=pk)
        topic_count = Topic.objects.filter(created_by=pk).count()
        action_count = Action.objects.filter(created_by=pk).count()
        vote_count = getUpvotes(me)
        given_vote_count = Vote.objects.filter(user_id=pk, score=1).count()
        user = get_object_or_404(CustomUser, pk=pk)
        user.topic_count = topic_count
        user.action_count = action_count
        user.vote_count = vote_count
        user.given_vote_count = given_vote_count
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


def getUpvotes(me):
    arr = []
    topics = Topic.objects.filter(created_by=me)
    for topic in topics:
        arr.append(topic.id)

    content_type_id = ContentType.objects.get_for_model(Topic).id
    votes = 0
    for id in arr:
        topic_votes = Vote.objects.filter(object_id=id, content_type_id=content_type_id).exclude(user_id=me.id)
        for topic_vote in topic_votes:
            votes = votes + 1

    arr = []
    actions = Action.objects.filter(created_by=me, approved=1)
    for action in actions:
        arr.append(action.id)

    content_type_id = ContentType.objects.get_for_model(Action).id
    for id in arr:
        action_votes = Vote.objects.filter(object_id=id, content_type_id=content_type_id).exclude(user_id=me.id)
        for action_vote in action_votes:
            votes = votes + 1

    return votes
