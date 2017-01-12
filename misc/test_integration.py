from django.core.urlresolvers import reverse

import mock

from topics.factories import TopicFactory
from untitled.testing import BaseAPITestCase


class MockResponse(object):

    def __init__(self, json_data, status_code):
        self.content = json_data
        self.status_code = status_code

    def json(self):
        return self.content


class NyTimesApiHelpersTestCase(BaseAPITestCase):

    def mock_nyt_get(self):
        return MockResponse({"response": "testing"}, 200)

    @mock.patch("requests.get", mock.Mock(side_effect=mock_nyt_get))
    def test_post_ok(self):
        payload = {"url": "http://www.google.com/"}
        response = self.client.post(reverse("nyt"), data=payload)
# @todo fix this        self.assert_get_ok(response)


class OpenGraphHelpersTestCase(BaseAPITestCase):

    def test_post_ok(self):
        # @todo response is a 500, instead of a 400, if the following
        # payload attributes don't exist
        user = self.create_user()
        topic = TopicFactory.create(created_by=user)
        payload = {
            "id": topic.id,
            "type": "not_topic",
            "url": "http://test.com"
        }

        response = self.client.post(reverse("open_graph"), data=payload)
        self.assertEqual(response.status_code, 200)


class GetUserFromTokenTestCase(BaseAPITestCase):

    # @todo this doesn't create or update anything, so it should probably use GET
    # instead of POST
    def test_post_ok(self):
        user = self.authenticate()
        response = self.client.post(reverse("token_user"), data={})
        self.assertEqual(response.status_code, 200)
        user_id = self.get_content(response)["user_id"]
        self.assertEqual(user.id, user_id)


class UserRegistrationTestCase(BaseAPITestCase):

    def test_post_ok(self):
        payload = {
            "email": "test@test.com",
            "username": "tester",
            "password": "testerzz"
        }
        response = self.client.post(reverse("user_register"), data=payload)
        self.assert_post_ok(response)
