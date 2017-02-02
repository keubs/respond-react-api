from rest_framework import serializers
from taggit_serializer.serializers import TagListSerializerField, TaggitSerializer

from .models import Action, Topic


class ActionSerializer(TaggitSerializer, serializers.ModelSerializer):
    score = serializers.ReadOnlyField()
    username = serializers.ReadOnlyField()
    tags = TagListSerializerField()
    address_raw = serializers.ReadOnlyField()

    class Meta:
        model = Action
        Fields = ('title', 'description', 'article_link', 'created_on', 'created_by', 'topic', 'tags', 'score', 'image_url', 'username', 'scope', 'address', 'start_date_time')
        many = True


class TopicSerializer(TaggitSerializer, serializers.ModelSerializer):
    tags = serializers.SerializerMethodField('format_tags')
    score = serializers.SerializerMethodField('print_score')
    username = serializers.SerializerMethodField()
    actions = serializers.ReadOnlyField()
    ranking = serializers.ReadOnlyField()
    thumbnail = serializers.SerializerMethodField()
    banner = serializers.ReadOnlyField()

    def format_tags(self, topic):
        # print(topic.tags)
        return [{'slug': tag.slug, 'name': tag.name.title()} for tag in topic.tags.all()]

    def print_score(self, topic):
        return topic.rating_likes

    def get_username(self, topic):
        return topic.created_by.username

    def get_thumbnail(self, topic):
        return topic.topic_thumbnail.url

    class Meta:
        model = Topic
        # Fields = ('title', 'description', 'article_link', 'created_by', 'tags', 'score', 'image_url', 'username')
        many = True


class TopicDetailSerializer(TaggitSerializer, serializers.ModelSerializer):
    tags = TagListSerializerField()
    score = serializers.ReadOnlyField()
    image = serializers.FileField()
    actions = ActionSerializer(many=True, read_only=True)
    action_count = serializers.ReadOnlyField()

    class Meta:
        model = Topic
        # Fields = ('title', 'article_link', 'created_by', 'created_on', 'tags', 'score', 'image', 'actions')
        many = True
