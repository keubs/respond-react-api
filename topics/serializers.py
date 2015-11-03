from .models import Topic, Action

from rest_framework import serializers
from taggit_serializer.serializers import TagListSerializerField, TaggitSerializer

class TopicSerializer(serializers.ModelSerializer):
	tags = TagListSerializerField()
	class Meta:
		model = Topic
		Fields = ('title', 'article_link', 'created_by', 'created_on', 'score')
		many = True

class ActionSerializer(serializers.ModelSerializer):
	tags = TagListSerializerField()
	class Meta:
		model = Action
		Fields = ('title', 'description', 'article_link', 'created_on', 'created_by', 'topic', 'score')