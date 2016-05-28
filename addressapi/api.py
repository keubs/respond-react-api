import requests

from address.models import Address
from .serializers import AddressSerializer

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class AddressPost(APIView):
    def post(self, request, format=None):

        latlng = getLatLng(request.data['raw'])

        request.data['latitude'] = latlng['lat']
        request.data['longitude'] = latlng['lng']

        serializer = AddressSerializer(data=request.data)
        if serializer.is_valid():
            addr = serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)


def getLatLng(data):
    response = requests.get('https://maps.googleapis.com/maps/api/geocode/json?address=' + data)

    resp_json_payload = response.json()

    return resp_json_payload['results'][0]['geometry']['location']