import requests

from address.models import Address, Country, Locality, State
from .serializers import AddressSerializer, CountrySerializer, LocalitySerializer, StateSerializer

from rest_framework.views import APIView
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework import status
from pprint import pprint

class AddressPost(APIView):
    def post(self, request, format=None):
        
        state = None
        locality = None
        address = None
        
        country_serializer = CountrySerializer(data={'name': request.data['country'], 'code': request.data['country_code']})
        
        try:
            if country_serializer.is_valid(raise_exception=True):
                country = country_serializer.save()
            else:
                return Response(country_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except serializers.ValidationError:
            country = Country.objects.get(name=request.data['country'])
        
        if 'state' in request.data:
            try:
                if len(request.data['state_code']) <= 3:
                    state_code = request.data['state_code']
                else:
                    state_code = request.data['state_code'][0:2]

                state_serializer = StateSerializer(data={'name': request.data['state'], 'code': state_code, 'country': country.id})
                if state_serializer.is_valid(raise_exception=True):
                    state = state_serializer.save()

                else:
                    return Response(state_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

            except serializers.ValidationError:
                state = State.objects.get(name=request.data['state'])

        else:
            pass
            # return Response(country_serializer.data, status=status.HTTP_200_OK)            

        if 'locality' in request.data and 'postal_code' in request.data:
            try:
                locality_serializer = LocalitySerializer(data={'name': request.data['locality'], 'postal_code': request.data['postal_code'], 'state': state.id})
                if locality_serializer.is_valid(raise_exception=True):
                    locality = locality_serializer.save()
                else:
                    return Response(locality_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

            except serializers.ValidationError:
                pprint(locality_serializer.errors)
                locality = Locality.objects.get(postal_code=request.data['postal_code'])

        else:
            pass
            # return Response(state_serializer.data, status=status.HTTP_200_OK)            


        try:
            address_serializer = AddressSerializer(
                data={
                    'raw': request.data['raw'], 
                    'latitude': request.data['latitude'], 
                    'longitude': request.data['longitude'], 
                    'locality': locality.id if locality else None
                    }
                )
            if address_serializer.is_valid(raise_exception=True):
                address = address_serializer.save()
                return Response(address_serializer.data, status=status.HTTP_201_CREATED)
            else:
                return Response(address_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        except serializers.ValidationError:
            return Response(address_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class AddressList(APIView):
    def get(self, request, format=None):
        addresses = Address.objects.all()

        serialized_addresses = AddressSerializer(addresses, many=True)
        return Response(serialized_addresses.data)

def getLatLng(data):
    response = requests.get('https://maps.googleapis.com/maps/api/geocode/json?address=' + data)

    resp_json_payload = response.json()

    return resp_json_payload['results'][0]['geometry']['location']