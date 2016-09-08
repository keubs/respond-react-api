from .models import Vote
from .serializers import VoteSerializer

from django.http import Http404
from django.conf import settings

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt import utils

from updown.views import AddRatingFromModel
from customuser.models import CustomUser
from pprint import pprint

class RatingPost(APIView):
    permission_classes = (IsAuthenticated, )
    authentication_classes = (JSONWebTokenAuthentication, )

    def post(self, request, model, app_label, object_id, field_name, score, **kwargs):
        serializer = VoteSerializer(data=request.data)

        user = utils.jwt_decode_handler(request.auth)['user_id']

        user = CustomUser.objects.get(id=user)

        addRating = AddRatingFromModel()

        return addRating(request, model, app_label, object_id, field_name, score, user)