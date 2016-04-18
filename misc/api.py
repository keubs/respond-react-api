import re
import urllib
import requests
import urllib.request
import json

import zipcode
import random

from opengraph import opengraph
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.models import User
from django.db import IntegrityError
from django.conf import settings
from .serializers import UserSerializer

from topics.models import Topic, Action
from topics.serializers import TopicSerializer
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
        try:
            og = opengraph.OpenGraph(url=request.data['url'])

            # Description may or may not exist
            if 'description' in og:
                desc = og['description']
            else:
                desc = ''
            return Response({'image' : og['image'], 'title' : og['title'], 'description' : desc}, status=status.HTTP_200_OK)
        except urllib.error.URLError:
            return Response({'image':'Invalid URL'}, status=status.HTTP_404_NOT_FOUND)
        except KeyError:
            return Response({'image':'Not Found'}, status=status.HTTP_404_NOT_FOUND)
        except:
            return Response({'response':'Forbidden'}, status=status.HTTP_403_FORBIDDEN)

class nyTimesAPIHelpers(APIView):
    def post(self, request, format=None):
        try:
            dictionary = requests.get('http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=web_url:("' + request.data['url'] + '")&api-key='+ settings.NY_TIMES_API_KEY).json()
            response = dictionary['response']
            return Response(response)
        except KeyError:
            return Response({"error" : "invalid data"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class geolocationHelpers(APIView):
    def post(self, request, format=None):
        gmapurl = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + request.data['zip']
        response = urllib.request.urlopen(gmapurl)
        content = response.read()
        data = json.loads(content.decode("utf8"))

        myzip = zipcode.isequal(request.data['zip'])
        ziplist = zipcode.getzipsinscope(request.data['zip'], request.data['scope'])

        # pprint(type(['adsf', 'afdasf']))
        # pprint(ziplist)

        pprint(random.choice(Topic.objects.filter(zip__in=ziplist)))
        cbus = (data['results'][0]['geometry']['location']['lat'], data['results'][0]['geometry']['location']['lng'])

        return Response(data['results'][0]['geometry']['location'], status=status.HTTP_200_OK)



class regionalGeolocateHelpers(APIView):
    def post(self, request, format=None):
        gmapurl = 'http://maps.googleapis.com/maps/api/geocode/json?address=%s' % request.data['zip']
        response = urllib.request.urlopen(gmapurl)
        content = response.read()
        data = json.loads(content.decode("utf8"))

        myzip = zipcode.isequal(request.data['zip'])
        if request.data['scope'] == 'world':
            topic = random.choice(Topic.objects.all())
        else:
            ziplist = zipcode.getzipsinscope(request.data['zip'], request.data['scope'])
            topic = random.choice(Topic.objects.filter(zip__in=ziplist))

        serialized_topic = TopicSerializer(topic)

        return Response(serialized_topic.data, status=status.HTTP_200_OK)

