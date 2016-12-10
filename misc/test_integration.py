from django.core.urlresolvers import reverse

from customuser.factories import CustomUserFactory
from topics.factories import TopicFactory
from untitled.testing import BaseAPITestCase


# class MiscApiNyTimesApiHelpersTestCase(BaseAPITestCase):
#
#     def test_post_ok(self):
#         # @todo mock the NYT request for testing
#         payload = {"url": "http://www.google.com/"}
#         response = self.client.post(reverse("nyt"), data=payload)
#         self.assertEqual(response.status_code, 200)


class MiscApiOpenGraphHelpersTestCase(BaseAPITestCase):

    def test_post_ok(self):
        # @todo response is a 500, instead of a 400, if the following
        # payload attributes don't exist
        user = CustomUserFactory.create()
        topic = TopicFactory.create(created_by=user)
        payload = {
            "id": topic.id,
            "type": "not_topic",
            "url": "http://test.com"
        }

        response = self.client.post(reverse("open_graph"), data=payload)
        self.assertEqual(response.status_code, 200)


class MiscApiTokenUserTestCase(BaseAPITestCase):

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
        self.assertEqual(response.status_code, 201)
