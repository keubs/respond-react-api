import json

from django.core.urlresolvers import reverse

from customuser.factories import CustomUserFactory
from topics.factories import TopicFactory
from untitled.testing import BaseAPITestCase


class TopicApiTestCase(BaseAPITestCase):

    def setUp(self):
        image = self.create_test_image()
        self.user = CustomUserFactory.create()
        self.topic = TopicFactory.create(created_by=self.user, image=image)


class TopicApiCountTestCase(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(reverse("topic_count"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(
            1, json.loads(response.content.decode("utf-8"))["count"])


class TopicApiDeleteTestCase(TopicApiTestCase):

    def test_delete_ok(self):
        # @todo i'm deleting a topic with a different user than the one that
        # created the topic. bug?
        self.authenticate()
        response = self.client.delete(
            reverse("topic_delete", kwargs={"pk": self.topic.id}))
        self.assertEqual(response.status_code, 204)


class TopicApiDetailTestCase(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(
            reverse("topic_detail", kwargs={"pk": self.topic.id}))
        self.assertEqual(response.status_code, 200)
        data = json.loads(response.content.decode("utf-8"))
        self.assertEqual(data["created_by"], self.topic.created_by.id)


class TopicApiListTestCase(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(reverse("topic_list"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(
            1, len(json.loads(response.content.decode("utf-8"))))


class TopicApiTagListTestCase(TopicApiTestCase):

    def test_get_ok(self):
        name = "test_tag"
        self.topic.tags.add("test_tag")
        self.topic.save()
        response = self.client.get(
            reverse("topic_tag_list", kwargs={"tag": name}))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(
            1, len(json.loads(response.content.decode("utf-8"))))


class TopicApiUpdateTestCase(TopicApiTestCase):

    def test_get_ok(self):
        new_title = "new_title"
        payload = {"title": new_title}

        self.authenticate(self.user)
        response = self.client.put(
            reverse("topic_update", kwargs={"pk": self.topic.id}),
            data=payload)
        self.assertEqual(response.status_code, 200)
        data = json.loads(response.content.decode("utf-8"))
        self.assertEqual(data["title"], new_title)
