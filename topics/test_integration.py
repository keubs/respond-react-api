import json

from django.core.urlresolvers import reverse

from customuser.factories import CustomUserFactory
from topics.factories import TopicFactory
from untitled.testing import BaseAPITestCase


class TopicListHelpersTestCase(BaseAPITestCase):

    def test_get_ok(self):
        image = self.create_test_image()
        user = CustomUserFactory.create()
        TopicFactory.create(created_by=user, image=image)

        response = self.client.get(reverse("topic_list"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(
            1, len(json.loads(response.content.decode("utf-8"))))
