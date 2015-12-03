import re
import urllib
from urllib.request import urlopen
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.models import User
from pprint import pprint
class UserRegistration(object):
    def create(self, validated_data):
        user = User(email=validated_data['email'], username=validated_data['username'])
        user.set_password(validated_data['password'])
        user.save()
        return user

class ImageHelpers(APIView):
    def post(self, request, format=None):
        try:
            html = urlopen(request.data['url'])
        except urllib.error.URLError:
            return Response({'image' : 'Url Does not Exist'}, status=status.HTTP_404_NOT_FOUND)
        string = html.read().decode('utf-8')
        search = re.search('"og:imeage" content="(.+)"', string, re.IGNORECASE)
        if search is not None:
            imgUrl = search.group(1)
            return Response({'image' : imgUrl}, status=status.HTTP_200_OK)
        return Response({'image' : 'og:image tag not detected'}, status=status.HTTP_404_NOT_FOUND)