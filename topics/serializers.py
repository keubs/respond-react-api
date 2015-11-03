from .models import Topic, Action

from rest_framework import serializers
from taggit_serializer.serializers import TagListSerializerField, TaggitSerializer

class TopicSerializer(TaggitSerializer, serializers.ModelSerializer):
    tags = TagListSerializerField()
    class Meta:
        model = Topic
        Fields = ('title', 'article_link', 'created_by', 'created_on', 'score', 'tags')
        many = True

class ActionSerializer(TaggitSerializer, serializers.ModelSerializer):
    tags = TagListSerializerField()
    class Meta:
        model = Action
        Fields = ('title', 'description', 'article_link', 'created_on', 'created_by', 'topic', 'score', 'tags')
        many = True