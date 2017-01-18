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
    url(
        r'^$',
        topic_views.home,
        name='home'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^o/', include('oauth2_provider.urls', namespace='oauth2_provider')),
    url(
        r'topic/(?P<pk>[0-9]+)$',
        topic_views.topic_details,
        name='topic_details'),

    # API urls
    url(r'^v1/', include([
        # actions
        url(
            r'^actions/submit$',
            topic_api.ActionPost.as_view(),
            name="action_create"),
        url(
            r'^actions/(?P<pk>[0-9]+)/$',
            topic_api.ActionDetailByTopic.as_view(),
            name="action_topic_detail"),
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
            topic_api.ActionList.as_view(),
            name="action_list"),
        url(
            r'^actionsbytopic/$',
            topic_api.ActionsForAllUserTopics.as_view(),
            name="action_topic_list"),
        url(
            r'^actions/tag/(?P<tag>.*)/$',
            topic_api.ActionListByTag.as_view(),
            name="action_tag_list"),
        url(
            r'^actions/unapproved/count/$',
            topic_api.UnapprovedActionCount.as_view(),
            name="action_unapproved_count"),
        url(
            r'^actions/unapproved/$',
            topic_api.UnapprovedActions.as_view(),
            name="action_unapproved_list"),
        url(
            r'^actions/(?P<pk>\d+)/approve/$',
            topic_api.ApproveAction.as_view(),
            name="action_approve"),
        url(
            r'^actions/(?P<pk>\d+)/delete/$',
            topic_api.ActionDelete.as_view(),
            name="action_delete"),

        # address
        url(
            r'^address/submit/$',
            address_api.AddressPost.as_view(),
            name="address_create_update"),
        url(
            r'^addresses/$',
            address_api.AddressList.as_view(),
            name="address_list"),
        url(
            r'^addresses/(?P<pk>[0-9]+)$',
            address_api.AddressList.as_view(),
            name="address_detail"),

        # misc
        url(
            r'^getopengraph/$',
            misc_api.OpenGraphHelpers.as_view(),
            name="open_graph"),
        url(
            r'^linkfactory/$',
            linkfactory_api.ProcessLink.as_view(),
            name="link_factory"),
        url(
            r'^login/',
            include('rest_social_auth.urls_jwt')),
        url(
            r'^misc/token-auth/$',
            misc_api.GetUserFromToken.as_view(),
            name="token_user"),
        url(
            r'^nytimes/$',
            misc_api.nyTimesAPIHelpers.as_view(),
            name="nyt"),
        url(
            r'^token-auth/',
            'rest_framework_jwt.views.obtain_jwt_token',
            name="jwt_token"),

        url(
            r'^popular-tags',
            misc_api.MostPopularTags.as_view(),
            name="popular_tags"),

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
            topic_api.TopicList.as_view(),
            name="topic_list"),
        url(
            r'^topics/count$',
            topic_api.TopicCount.as_view(),
            name="topic_count"),
        url(
            r'^topics/(?P<pk>[0-9]+)$',
            topic_api.TopicDetail.as_view(),
            name="topic_detail"),
        url(
            r'^topics/(?P<pk>[0-9]+)/delete$',
            topic_api.TopicDelete.as_view(),
            name="topic_delete"),
        url(
            r'^topics/tag/(?P<tag>.*)/$',
            topic_api.TopicListByTag.as_view(),
            name="topic_tag_list"),
        url(
            r'^topics/(?P<pk>[0-9]+)/update$',
            topic_api.TopicUpdate.as_view(),
            name="topic_update"),
        url(
            r'^topics/scope/(?P<scope>.*)/$',
            topic_api.TopicByScope.as_view(),
            name="topic_scope"),
        url(
            r'^topics/submit$',
            topic_api.TopicPost.as_view(),
            name="topic_create"),
        url(
            r'^topics/(?P<pk>[0-9]+)/actions/$',
            topic_api.ActionListByTopic.as_view(),
            name="topic_action_list"),

        # users
        url(
            r'^users/(?P<pk>.*)/topics/$',
            topic_api.TopicListByUser.as_view(),
            name="user_topics"),
        url(
            r'users/$',
            customuser_viewset.CustomUserViewSet.as_view({'get': 'list'}),
            name="user_list"),
        url(
            r'users/(?P<pk>[0-9]+)/update$',
            customuser_viewset.CustomUserViewSet.as_view({'post': 'update'}),
            name="user_update"),
        url(
            r'users/(?P<pk>[0-9]+)/$',
            customuser_viewset.CustomUserViewSet.as_view({'get': 'retrieve'}),
            name="user_detail"),
        url(
            r'^user/register/$',
            misc_api.UserRegistration.as_view(),
            name="user_register"),
    ]))
] 
#+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
