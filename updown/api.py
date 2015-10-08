from .models import Vote
from .serializers import VoteSerializer

from django.http import Http404
from django.contrib.auth.models import User

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

        
        user = utils.jwt_decode_handler('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InVzZXIyIiwiZW1haWwiOiJ1c2VyMkB0ZXN0LmNvbSIsImV4cCI6MTQ0NDM0ODE0OSwidXNlcl9pZCI6M30.RlVrGj2zEgQuMTAPeawuP-pYy_nIyTVkYJzb133qvHY')['user_id']
        user = User.objects.get(id=user)

        rating = AddRatingFromModel()

        pprint(rating(request, model, app_label, object_id, field_name, score, user))