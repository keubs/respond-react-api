import re
import urllib
import opengraph

from urllib.request import urlopen
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.models import User
from pprint import pprint
class UserRegistration(APIView):
    def post(self, request, format=None):
        try:
            user = User(email=request.data['email'], username=request.data['username'])
            user.save()
            return Response({'booya':'grandma'}, status=status.HTTP_201_CREATED)
        except IntegrityError as e:
            return Response({'booya':'grandma'}, status=status.HTTP_404_NOT_FOUND)


class ImageHelpers(APIView):
    def post(self, request, format=None):

        og = opengraph.OpenGraph(url=request.data['url'])
        return Response({'image' : og['image']}, status=status.HTTP_200_OK)