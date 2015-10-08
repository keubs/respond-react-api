from django.conf.urls import include, url
from django.contrib import admin
from topics import api as topic_api

from rest_framework.urlpatterns import format_suffix_patterns
from updown.views import AddRatingFromModel
from updown import api as updown_api

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/topics/$', topic_api.TopicList.as_view()),
    url(r'^api/topics/submit$', topic_api.TopicPost.as_view()),
    url(r'^api/topics/(?P<pk>[0-9]+)/$', topic_api.TopicDetail.as_view()),
    url(r'^api-token-auth/', 'rest_framework_jwt.views.obtain_jwt_token'),
    # url(r'^api/topics/(?P<object_id>\d+)/rate/(?P<score>[\d\-]+)$', AddRatingFromModel(), {
    #     'app_label': 'topics',
    #     'model': 'Topic',
    #     'field_name': 'rating',
    # }, name="topic_rating"),
    url(r'^api/topics/(?P<object_id>\d+)/rate/(?P<score>[\d\-]+)$', updown_api.RatingPost.as_view(), {
        'app_label': 'topics',
        'model': 'Topic',
        'field_name': 'rating',
    }, name="topic_rating"),
]
