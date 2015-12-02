import re
from urllib.request import urlopen
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.models import User
class UserRegistration(object):
from pprint import pprint
    def create(self, validated_data):
        user = User(email=validated_data['email'], username=validated_data['username'])
        user.set_password(validated_data['password'])
        user.save()
        return user

class ImageHelpers(APIView):
    def post(self, request, format=None):
        html = urlopen(request.data['url'])
        string = html.read().decode('utf-8')
        imgUrl = re.search('"og:image" content="(.+)"', string, re.IGNORECASE).group(1)
        return Response('{"response":"'+imgUrl+'"}', status=status.HTTP_200_OK)