from .models import CustomUser

from django.shortcuts import get_object_or_404
from .serializers import CustomUserSerializer

from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import detail_route

from pprint import pprint
class CustomUserViewSet(viewsets.ViewSet):
    def list(self, request):
        queryset = CustomUser.objects.all()
        serializer = CustomUserSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        queryset = CustomUser.objects.all()
        user = get_object_or_404(queryset, pk=pk)
        serializer = CustomUserSerializer(user)
        return Response(serializer.data)