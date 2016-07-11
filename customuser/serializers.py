from .models import CustomUser

from rest_framework import serializers


class CustomUserSerializer(serializers.ModelSerializer):
	# customuser = CustomUser
	# score = serializers.ReadOnlyField()

	class Meta:
		model = CustomUser
		fields = ('last_login', 'username', 'first_name', 'last_name', 'email', 'social_thumb')