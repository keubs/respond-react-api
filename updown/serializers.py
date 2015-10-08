from .models import Vote

from rest_framework import serializers

class VoteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vote
        Fields = ('object_id', 'key', 'score', 'user', 'ip_address', 'date_added', 'date_changed', 'content_object')