from django.conf.urls import include, url
from django.contrib import admin
from django.conf.urls.static import static
from django.conf import settings

from topics import api as topic_api

from rest_framework.urlpatterns import format_suffix_patterns
from updown.views import AddRatingFromModel
from updown import api as updown_api
from misc import api as misc_api

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),

    # Topics
    url(r'^api/topics/$', topic_api.TopicList.as_view()),
    url(r'^api/topics/(?P<tag>[a-z]+)/$', topic_api.TopicListByTag.as_view()),
    url(r'^api/topics/submit$', topic_api.TopicPost.as_view()),
    url(r'^api/topics/(?P<pk>[0-9]+)/$', topic_api.TopicDetail.as_view()),
    url(r'^api/token-auth/', 'rest_framework_jwt.views.obtain_jwt_token'),
    url(r'^api/topics/(?P<object_id>\d+)/rate/(?P<score>[\d\-]+)$', updown_api.RatingPost.as_view(), {
        'app_label': 'topics',
        'model': 'Topic',
        'field_name': 'rating',
    }, name="topic_rating"),

    # Actions
    url(r'^api/topics/(?P<pk>[0-9]+)/actions/$', topic_api.ActionListByTopic.as_view()),
    url(r'^api/topics/(?P<pk>[0-9]+)/actions/submit$', topic_api.ActionPost.as_view()),
    url(r'^api/topics/(?P<pk>[0-9]+)/actions/(?P<fk>[0-9]+)/$', topic_api.ActionDetailByTopic.as_view()),
    url(r'^api/topics/(?P<object_id>\d+)/rate/(?P<score>[\d\-]+)$', updown_api.RatingPost.as_view(), {
        'app_label': 'topics',
        'model': 'Action',
        'field_name': 'rating',
    }, name="action_rating"),
    url(r'^api/actions/$', topic_api.ActionList.as_view()),

    url(r'^api/suggest/(?P<tag>[a-z]+)$', topic_api.SuggestTest.as_view()),

    url(r'^api/getimage/$', misc_api.ImageHelpers.as_view()),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
