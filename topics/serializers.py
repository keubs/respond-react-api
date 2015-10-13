from .models import Topic, Action

from rest_framework import serializers

class TopicSerializer(serializers.ModelSerializer):
    score = serializers.ReadOnlyField()
    class Meta:
        model = Topic
        Fields = ('title', 'article_link', 'created_by', 'created_on', 'score')
        many = True

class ActionSerializer(serializers.ModelSerializer):
    # score = serializers.ReadOnlyField()
    class Meta:
        model = Action
        Fields = ('title', 'description', 'article_link', 'created_on', 'created_by', 'topic', 'score')