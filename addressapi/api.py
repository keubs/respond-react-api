import requests

from address.models import Address, Country, Locality, State
from .serializers import AddressSerializer, CountrySerializer, LocalitySerializer, StateSerializer, AddressSerializerGet

from django.shortcuts import get_object_or_404

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from annoying.functions import get_object_or_None


class AddressPost(APIView):
    def post(self, request, format=None):
        if 'country' in request.data:
            countryObj = get_object_or_None(Country, name=request.data['country'], code=request.data['country_code'])
            country_serializer = CountrySerializer(countryObj, data={'name': request.data['country'], 'code': request.data['country_code']})

            if country_serializer.is_valid():
                country = country_serializer.save()
            else:
                return Response(country_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        if 'state' in request.data:
            if len(request.data['state_code']) <= 3:
                state_code = request.data['state_code']
            else:
                state_code = request.data['state_code'][0:2]
            stateObj = get_object_or_None(State, name=request.data['state'], code=state_code, country=country.id)
            state_serializer = StateSerializer(stateObj, data={'name': request.data['state'], 'code': state_code, 'country': country.id})

            if state_serializer.is_valid():
                state = state_serializer.save()
            else:
                return Response(state_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        locality = None
        if 'locality' in request.data and 'postal_code' in request.data:
            localityObj = get_object_or_None(Locality, name=request.data['locality'], postal_code=request.data['postal_code'], state=state.id)
            locality_serializer = LocalitySerializer(localityObj, data={'name': request.data['locality'], 'postal_code': request.data['postal_code'], 'state': state.id})

            if locality_serializer.is_valid():
                locality = locality_serializer.save()
            else:
                return Response(locality_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        lid = locality.id if locality else None
        # @todo if `latitude`, `longitude`, `raw` and `formatted` don't exist in
        # the payload, this throws an exception instead of returning a 400.
        addressObj = get_object_or_None(Address, latitude=request.data['latitude'], longitude=request.data['longitude'], raw=request.data['formatted'])
        address_serializer = AddressSerializer(addressObj, data={
            'raw': request.data['raw'],
            'latitude': request.data['latitude'],
            'longitude': request.data['longitude'],
            'locality': lid
        })

        if addressObj is None:
            stat = status.HTTP_201_CREATED
        else:
            stat = status.HTTP_200_OK

        if address_serializer.is_valid():
            address_serializer.save()
            return Response(address_serializer.data, status=stat)
        else:
            return Response(address_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class AddressList(APIView):
    def get(self, request, format=None, pk=None):
        if pk is not None:
            address = get_object_or_404(Address, pk=pk)
            serialized_address = AddressSerializerGet(address, many=False)
            return Response(serialized_address.data, status=status.HTTP_200_OK)
        else:
            addresses = Address.objects.all()
            serialized_addresses = AddressSerializerGet(addresses, many=True)
            return Response(serialized_addresses.data, status=status.HTTP_200_OK)


def getLatLng(data):
    response = requests.get('https://maps.googleapis.com/maps/api/geocode/json?address=' + data)
    resp_json_payload = response.json()
    return resp_json_payload['results'][0]['geometry']['location']
