from .models import Vote
from .serializers import VoteSerializer

from django.http import Http404
from django.contrib.auth.models import User
from django.conf import settings

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt import utils

from updown.views import AddRatingFromModel
from pprint import pprint

class RatingPost(APIView):
    # permission_classes = (IsAuthenticated, )
    # authentication_classes = (JSONWebTokenAuthentication, )

    def get(self, request, model, app_label, object_id, field_name, score, **kwargs):
        serializer = VoteSerializer(data=request.data)

        
        if settings.BUILDING is True:
            user = 1
        if settings.BUILDING is False:
            user = utils.jwt_decode_handler(request.auth)['user_id']

        user = User.objects.get(id=user)

        rating = AddRatingFromModel()

        return rating(request, model, app_label, object_id, field_name, score, user)