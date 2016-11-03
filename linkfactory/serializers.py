from .models import Link, LinkType

from rest_framework import serializers


class LinkSerializer(serializers.ModelSerializer):
	link = Link
	class Meta:
		model = Link


class LinkTypeSerializer(serializers.ModelSerializer):
	linktype = LinkType
	class Meta:
		model = LinkType