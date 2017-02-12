from rest_framework import serializers
from taggit_serializer.serializers import TaggitSerializer, TagListSerializerField

from .models import Action, Topic


class ActionSerializer(TaggitSerializer, serializers.ModelSerializer):
    score = serializers.SerializerMethodField()
    username = serializers.SerializerMethodField()
    tags = TagListSerializerField()
    # address = serializers.SerializerMethodField()
    address_raw = serializers.SerializerMethodField('get_raw')

    def get_address(self, action):
        if action.address is not None:
            return action.address
        else:
            return None

    def get_raw(self, action):
        if(hasattr(action, 'address')):
            if action.address is not None:
                return action.address.raw
            else:
                return None
        else:
            return None

    def get_username(self, action):
        if(hasattr(action, 'created_by')):
            return action.created_by.username

    def get_score(self, action):
        if(hasattr(action, 'rating_likes')):
            return action.rating_likes
        else:
            return 0

    def format_tags(self, action):
        if(hasattr(action, 'tags')):
            if(hasattr(action.tags, 'all')):
                return [{'slug': tag.slug, 'name': tag.name.title()} for tag in action.tags.all()]

    class Meta:
        model = Action
        Fields = ('title', 'description', 'article_link', 'created_on', 'created_by', 'topic', 'tags', 'score', 'image_url', 'username', 'scope', 'address', 'start_date_time')
        many = True


class TopicSerializer(TaggitSerializer, serializers.ModelSerializer):
    tags = TagListSerializerField()
    score = serializers.SerializerMethodField()
    username = serializers.SerializerMethodField()
    actions = serializers.SerializerMethodField()
    ranking = serializers.ReadOnlyField()
    thumbnail = serializers.SerializerMethodField()
    banner = serializers.ReadOnlyField()

    def format_tags(self, topic):
        return [{'slug': tag.slug, 'name': tag.name.title()} for tag in topic.tags.all()]

    def get_score(self, topic):
        return topic.rating_likes

    def get_thumbnail(self, topic):
        return topic.topic_thumbnail.url

    def get_username(self, topic):
        return topic.created_by.username

    def get_actions(self, topic):
        return topic.action_set.count()

    class Meta:
        model = Topic
        # Fields = ('title', 'description', 'article_link', 'created_by', 'tags', 'score', 'image_url', 'username')
        many = True


class TopicDetailSerializer(TaggitSerializer, serializers.ModelSerializer):
    tags = serializers.SerializerMethodField('format_tags')
    score = serializers.SerializerMethodField()
    image = serializers.FileField()
    action_count = serializers.SerializerMethodField('get_actions')
    username = serializers.SerializerMethodField()
    banner = serializers.SerializerMethodField()
    address = serializers.SerializerMethodField()

    def get_address(self, topic):
        if topic.address is not None:
            return topic.address.raw
        else:
            return None

    def get_username(self, topic):
        return topic.created_by.username

    def format_tags(self, topic):
        return [{'slug': tag.slug, 'name': tag.name.title()} for tag in topic.tags.all()]

    def get_actions(self, topic):
        return topic.action_set.count()

    def get_score(self, topic):
        return topic.rating_likes

    def get_banner(self, topic):
        return topic.topic_banner.url

    class Meta:
        model = Topic
        # Fields = ('title', 'article_link', 'created_by', 'created_on', 'tags', 'score', 'image', 'actions')
        many = True
