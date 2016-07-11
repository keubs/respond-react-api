from .models import CustomUser

from rest_framework import serializers


class CustomUserSerializers(serializers.ModelSerializer):
	customuser = CustomUser
	class Meta:
		model = CustomUser