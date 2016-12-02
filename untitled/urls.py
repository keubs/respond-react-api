from django.conf.urls import include, url
from django.contrib import admin
from django.conf.urls.static import static
from django.conf import settings

from addressapi import api as address_api
from customuser import api as customuser_viewset
from linkfactory import api as linkfactory_api
from misc import api as misc_api
from topics import api as topic_api
from topics import views as topic_views
from updown import api as updown_api

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^o/', include('oauth2_provider.urls', namespace='oauth2_provider')),
    url(
        r'topic/(?P<pk>[0-9]+)$',
        topic_views.topic_details,
        name='topic_details'),
    url(r'^v1/', include([
        # actions
        url(
            r'^actions/submit$',
            topic_api.ActionPost.as_view()),
        url(
            r'^actions/(?P<pk>[0-9]+)/$',
            topic_api.ActionDetailByTopic.as_view()),
        url(
            r'^actions/(?P<object_id>\d+)/rate/(?P<score>[\d\-]+)$',
            updown_api.RatingPost.as_view(), {
                'app_label': 'topics',
                'model': 'Action',
                'field_name': 'rating',
            },
            name="action_rating"),
        url(
            r'^actions/$',
            topic_api.ActionList.as_view()),
        url(
            r'^actionsbytopic/$',
            topic_api.ActionsForAllUserTopics.as_view()),
        url(
            r'^actions/tag/(?P<tag>.*)/$',
            topic_api.ActionListByTag.as_view()),
        url(
            r'^actions/unapproved/count/$',
            topic_api.UnapprovedActionCount.as_view()),
        url(
            r'^actions/unapproved/$',
            topic_api.UnapprovedActions.as_view()),
        url(
            r'^actions/(?P<pk>\d+)/approve/$',
            topic_api.ApproveAction.as_view()),
        url(
            r'^actions/(?P<pk>\d+)/delete/$',
            topic_api.ActionDelete.as_view()),

        # address
        url(
            r'^address/submit/$',
            address_api.AddressPost.as_view()),
        url(
            r'^addresses/$',
            address_api.AddressList.as_view()),
        url(
            r'^addresses/(?P<pk>[0-9]+)$',
            address_api.AddressList.as_view()),

        url(
            r'^geolocate/$',
            misc_api.regionalGeolocateHelpers.as_view()),
        url(
            r'^getopengraph/$',
            misc_api.OpenGraphHelpers.as_view()),

        url(
            r'^linkfactory/$',
            linkfactory_api.ProcessLink.as_view()),
        url(
            r'^misc/token-auth/$',
            misc_api.GetUserFromToken.as_view()),

        url(
            r'^nytimes/$',
            misc_api.nyTimesAPIHelpers.as_view()),

        url(
            r'^token-auth/',
            'rest_framework_jwt.views.obtain_jwt_token'),

        # topics
        url(
            r'^topics/(?P<object_id>\d+)/rate/(?P<score>[\d\-]+)$',
            updown_api.RatingPost.as_view(), {
                'app_label': 'topics',
                'model': 'Topic',
                'field_name': 'rating',
            },
            name="topic_rating"),
        url(
            r'^topics/$',
            topic_api.TopicList.as_view()),
        url(
            r'^topics/count$',
            topic_api.TopicCount.as_view()),
        url(
            r'^topics/(?P<pk>[0-9]+)$',
            topic_api.TopicDetail.as_view()),
        url(
            r'^topics/(?P<pk>[0-9]+)/delete$',
            topic_api.TopicDelete.as_view()),
        url(
            r'^topics/tag/(?P<tag>.*)/$',
            topic_api.TopicListByTag.as_view()),
        url(
            r'^topics/(?P<pk>[0-9]+)/update$',
            topic_api.TopicUpdate.as_view()),
        url(
            r'^topics/scope/(?P<scope>.*)/$',
            topic_api.TopicByScope.as_view()),
        url(
            r'^topics/submit$',
            topic_api.TopicPost.as_view()),
        url(
            r'^topics/(?P<pk>[0-9]+)/actions/$',
            topic_api.ActionListByTopic.as_view()),
        url(
            r'^topics/(?P<pk>[0-9]+)/actions/(?P<fk>[0-9]+)/$',
            topic_api.ActionDetailByTopic.as_view()),

        # users
        url(
            r'^users/(?P<pk>.*)/topics/$',
            topic_api.TopicListByUser.as_view()),
        url(
            r'users/$',
            customuser_viewset.CustomUserViewSet.as_view({'get': 'list'})),
        url(
            r'users/(?P<pk>[0-9]+)/update$',
            customuser_viewset.CustomUserViewSet.as_view({'post': 'update'})),
        url(
            r'users/(?P<pk>[0-9]+)/$',
            customuser_viewset.CustomUserViewSet.as_view({'get': 'retrieve'})),
        url(
            r'^user/register/$',
            misc_api.UserRegistration.as_view()),
    ]))
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
