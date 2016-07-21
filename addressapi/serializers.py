from address.models import Address, Locality, State, Country

from rest_framework import serializers


class CountrySerializer(serializers.ModelSerializer):
	country = Country
	class Meta:
		model = Country

class StateSerializerGet(serializers.ModelSerializer):
	state = State
	country = CountrySerializer(read_only=True)
	class Meta:
		model = State

class LocalitySerializerGet(serializers.ModelSerializer):
	locality = Locality
	state = StateSerializerGet(read_only=True)
	class Meta:
		model = Locality

class AddressSerializerGet(serializers.ModelSerializer):
    address = Address
    locality = LocalitySerializerGet(read_only=True)
    class Meta:
        model = Address


# @todo I don't want to handle this this way, but I also don't have a better solution
class StateSerializer(serializers.ModelSerializer):
	state = State
	class Meta:
		model = State

class LocalitySerializer(serializers.ModelSerializer):
	locality = Locality
	class Meta:
		model = Locality

class AddressSerializer(serializers.ModelSerializer):
    address = Address
    class Meta:
        model = Address


