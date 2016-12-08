import re

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .models import Link, LinkType
from .serializers import LinkTypeSerializer


class ProcessLink(APIView):
    def post(self, request, format=None):
        url = request.data['url']
        links = Link.objects.all()
        linktypes = None

        for link in links:
            if re.search(link.preg, url) is not None:
                linktypes = LinkType.objects.filter(link=link)
                break

        if linktypes is not None:
            linktype_serializer = LinkTypeSerializer(linktypes, many=True)
            return Response(linktype_serializer.data, status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_204_NO_CONTENT)
