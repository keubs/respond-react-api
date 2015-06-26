from .models import Topic

from rest_framework import serializers

class TopicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        Fields = ('title', 'article_link', 'created_by', 'created_on')