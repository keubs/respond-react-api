from django.conf.urls import include, url
from django.contrib import admin
from django.conf.urls.static import static
from django.conf import settings

from topics import api as topic_api

from rest_framework.urlpatterns import format_suffix_patterns
from updown.views import AddRatingFromModel
from updown import api as updown_api
from misc import api as misc_api
from linkfactory import api as linkfactory_api
from addressapi import api as address_api
from customuser import api as customuser_viewset

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),

    # Topics
    url(r'^api/topics/$', topic_api.TopicList.as_view()),
    url(r'^api/topics/count$', topic_api.TopicCount.as_view()),
    url(r'^api/topics/tag/(?P<tag>.*)/$', topic_api.TopicListByTag.as_view()),
    url(r'^api/topics/submit$', topic_api.TopicPost.as_view()),
    url(r'^api/topics/(?P<pk>[0-9]+)$', topic_api.TopicDetail.as_view()),
    url(r'^api/token-auth/', 'rest_framework_jwt.views.obtain_jwt_token'),
    url(r'^api/topics/(?P<object_id>\d+)/rate/(?P<score>[\d\-]+)$', updown_api.RatingPost.as_view(), {
        'app_label': 'topics',
        'model': 'Topic',
        'field_name': 'rating',
    }, name="topic_rating"),

    # Actions
    url(r'^api/topics/(?P<pk>[0-9]+)/actions/$', topic_api.ActionListByTopic.as_view()),
    url(r'^api/actions/submit$', topic_api.ActionPost.as_view()),
    url(r'^api/topics/(?P<pk>[0-9]+)/actions/(?P<fk>[0-9]+)/$', topic_api.ActionDetailByTopic.as_view()),
    url(r'^api/actions/(?P<object_id>\d+)/rate/(?P<score>[\d\-]+)$', updown_api.RatingPost.as_view(), {
        'app_label': 'topics',
        'model': 'Action',
        'field_name': 'rating',
    }, name="action_rating"),
    url(r'^api/actions/$', topic_api.ActionList.as_view()),
    url(r'^api/actions/tag/(?P<tag>.*)/$', topic_api.ActionListByTag.as_view()),

    url(r'^api/getopengraph/$', misc_api.OpenGraphHelpers.as_view()),

    url(r'api/misc/token-auth/$', misc_api.GetUserFromToken.as_view()),

    url(r'^api/nytimes/$', misc_api.nyTimesAPIHelpers.as_view()),
    url(r'^api/geolocate/$', misc_api.regionalGeolocateHelpers.as_view()),

    url(r'^api/user/register/$', misc_api.UserRegistration.as_view()),
    url(r'^api/login/', include('rest_social_auth.urls_jwt')),

    url(r'^o/', include('oauth2_provider.urls', namespace='oauth2_provider')),

    url(r'^api/linkfactory/$', linkfactory_api.ProcessLink.as_view()),

    url(r'^api/address/submit/$', address_api.AddressPost.as_view()),
    url(r'^api/addresses/$', address_api.AddressList.as_view()),
    url(r'^api/addresses/(?P<pk>[0-9]+)$', address_api.AddressList.as_view()),

    url(r'api/users/$', customuser_viewset.CustomUserViewSet.as_view({'get': 'list'})),
    url(r'api/users/(?P<pk>[0-9]+)/update$', customuser_viewset.CustomUserViewSet.as_view({'post': 'update'})),
    url(r'api/users/(?P<pk>[0-9]+)', customuser_viewset.CustomUserViewSet.as_view({'get': 'retrieve'}))
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
