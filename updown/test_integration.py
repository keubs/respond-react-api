from django.core.urlresolvers import reverse

from topics.factories import TopicFactory
from untitled.testing import BaseAPITestCase


class RatingPost(BaseAPITestCase):

    def test_post_ok(self):
        payload = {}
        user = self.authenticate()
        topic = TopicFactory.create(created_by=user)
        response = self.client.post(
            reverse("topic_rating", kwargs={"object_id": topic.id, "score": 1}),
            data=payload)
        self.assertEqual(response.status_code, 201)
