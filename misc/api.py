import re
import urllib
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
        try:
            html = urlopen(request.data['url'])
        except urllib.error.URLError:
            return Response({'image' : 'Url Does not Exist'}, status=status.HTTP_404_NOT_FOUND)
        string = html.read().decode('utf-8')
        search = re.search('"og:image" content="(.+)"', string, re.IGNORECASE)
        if search is not None and search.group(1) is not None:
            imgUrl = search.group(1)
            return Response({'image' : imgUrl}, status=status.HTTP_200_OK)
        return Response({'image' : 'og:image tag not detected'}, status=status.HTTP_404_NOT_FOUND)