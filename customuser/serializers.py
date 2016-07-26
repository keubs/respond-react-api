from .models import CustomUser

from rest_framework import serializers


class CustomUserSerializer(serializers.ModelSerializer):
	# customuser = CustomUser
	# score = serializers.ReadOnlyField()
	topic_count = serializers.ReadOnlyField()
	action_count = serializers.ReadOnlyField()
	vote_count = serializers.ReadOnlyField()
	class Meta:
		model = CustomUser
		fields = ('last_login', 'username', 'first_name', 'last_name', 'email', 'social_thumb', 'topic_count', 'action_count', 'vote_count', 'address', 'id')
		read_only_fields = ('username',)