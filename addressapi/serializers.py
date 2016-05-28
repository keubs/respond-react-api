from address.models import Address

from rest_framework import serializers


class AddressSerializer(serializers.ModelSerializer):
    address = Address
    class Meta:
        model = Address
