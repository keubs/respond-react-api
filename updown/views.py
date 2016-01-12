# -*- coding: utf-8 -*-
"""
updown.views
~~~~~~~~~~~~

Basic views for voting

:copyright: 2011, weluse (http://weluse.de)
:author: 2011, Daniel Banck <dbanck@weluse.de>
:license: BSD, see LICENSE for more details.
"""
from django.contrib.contenttypes.models import ContentType
from django.core.exceptions import ObjectDoesNotExist
from django.http import HttpResponse, Http404

from updown.exceptions import *

from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status

from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from pprint import pprint
class AddRatingView(object):

    permission_classes = (IsAuthenticated, )
    authentication_classes = (JSONWebTokenAuthentication, )
    def __call__(self, request, content_type_id, object_id, field_name, score, user):
        """__call__(request, content_type_id, object_id, field_name, score)

        Adds a vote to the specified model field."""

        try:
            instance = self.get_instance(content_type_id, object_id)
        except ObjectDoesNotExist:
            raise Http404('Object does not exist')

        context = self.get_context(request)
        context['instance'] = instance

        try:
            field = getattr(instance, field_name)
        except AttributeError:
            return self.invalid_field_response(request, context)

        context.update({
            'field': field,
            'score': score,
        })


        try:
            had_voted = bool(field.get_rating_for_user(request.user,
                                                       request.META['REMOTE_ADDR']))

            context['had_voted'] = had_voted
            field.add(score, user, request.META['REMOTE_ADDR'])
        except AuthRequired:
            return self.authentication_required_response(request, context)
        except InvalidRating:
            return self.invalid_rating_response(request, context)
        except CannotChangeVote:
            return self.cannot_change_vote_response(request, context)
        if had_voted:
            return self.rating_changed_response(request, context)
        return self.rating_added_response(request, context)

    def get_context(self, request, context={}):
        return context

    def render_to_response(self, template, context, request):
        raise NotImplementedError

    def rating_changed_response(self, request, context):

        return Response({"response":"Vote changed"}, status=status.HTTP_200_OK)
        # response = HttpResponse('Vote changed.')
        # return Response

    def rating_added_response(self, request, context):
        return Response({"response":"Vote recorded."}, status=status.HTTP_201_CREATED)
        # response = HttpResponse('Vote recorded.')
        # return Response

    def authentication_required_response(self, request, context):
        return Response({"response":"You must be logged in to vote."}, status=status.HTTP_403_FORBIDDEN)
        # response = HttpResponse('You must be logged in to vote.')
        # response.status_code = 403
        # return Response

    def cannot_change_vote_response(self, request, context):
        return Response({"response":"You have already voted."}, status=status.HTTP_200_OK)
        # response = HttpResponse('You have already voted.')
        # response.status_code = 403
        # return Response

    def invalid_field_response(self, request, context):
        return Response({"response":"Invalid field name."}, status=status.HTTP_403_FORBIDDEN)
        # response = HttpResponse('Invalid field name.')
        # response.status_code = 403
        # return Response

    def invalid_rating_response(self, request, context):
        return Response({"response":"Invalid rating value."}, status=status.HTTP_403_FORBIDDEN)
        # response = HttpResponse('Invalid rating value.')
        # response.status_code = 403
        # return Response

    def get_instance(self, content_type_id, object_id):
        return ContentType.objects.get(pk=content_type_id)\
            .get_object_for_this_type(pk=object_id)


class AddRatingFromModel(AddRatingView):
    def __call__(self, request, model, app_label, object_id, field_name, score, user, **kwargs):
        """__call__(request, model, app_label, object_id, field_name, score)

        Adds a vote to the specified model field."""


        try:
            content_type = ContentType.objects.get(model=model.lower(), app_label=app_label)
        except ContentType.DoesNotExist:

            raise Http404('Invalid `model` or `app_label`.')

        return super(AddRatingFromModel, self).__call__(request, content_type.id,
                                                        object_id, field_name, score, user)