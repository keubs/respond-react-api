from address.models import Address, Locality, State, Country

from rest_framework import serializers


class AddressSerializer(serializers.ModelSerializer):
    address = Address
    class Meta:
        model = Address

class LocalitySerializer(serializers.ModelSerializer):
	locality = Locality
	class Meta:
		model = Locality

class StateSerializer(serializers.ModelSerializer):
	state = State
	class Meta:
		model = State

class CountrySerializer(serializers.ModelSerializer):
	country = Country
	class Meta:
		model = Country

