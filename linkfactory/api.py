from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .models import Link
from pprint import pprint

class ProcessLink(APIView):
    def post(self, request, format=None):
        try:
            links = Link.objects.all();

            return Response({}, status=status.HTTP_200_OK)
        except:
            return Response({}, status=status.HTTP_400_BAD_REQUEST)