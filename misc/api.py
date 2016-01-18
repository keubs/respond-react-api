import re
import urllib
from opengraph import opengraph
from urllib.request import urlopen
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.models import User
from django.db import IntegrityError
from .serializers import UserSerializer
from pprint import pprint
class UserRegistration(APIView):
    def post(self, request, format=None):
        try:
            user = User(email=request.data['email'], username=request.data['username'], password=request.data['password'])

            user.save()

            # Get new user id and return in response
            request.data['id'] = user.id
            serialized_user = UserSerializer(request.data)
            return Response(serialized_user.data, status=status.HTTP_201_CREATED)
        except IntegrityError as e:
            return Response({'user':'username or email already in use'}, status=status.HTTP_409_CONFLICT)


class OpenGraphHelpers(APIView):
    def post(self, request, format=None):
        og = opengraph.OpenGraph(url=request.data['url'])
        try:
            return Response({'image' : og['image'], 'title' : og['title']}, status=status.HTTP_200_OK)
        except urllib.error.URLError:
            return Response({'image':'Invalid URL'}, status=status.HTTP_404_NOT_FOUND)
        except KeyError:
            return Response({'image':'Not Found'}, status=status.HTTP_404_NOT_FOUND)