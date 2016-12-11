import random

from django.core.urlresolvers import reverse

from customuser.factories import CustomUserFactory
from topics.factories import ActionFactory, TopicFactory
from untitled.testing import BaseAPITestCase


class TopicApiTestCase(BaseAPITestCase):

    def setUp(self):
        # @todo this doesn't need to run on every test...
        # use helpers instead
        image = self.create_test_image()
        self.user = CustomUserFactory.create()
        self.topic = TopicFactory.create(created_by=self.user, image=image)


class TopicApiCountTestCase(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(reverse("topic_count"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(1, self.get_content(response)["count"])


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
        self.assertEqual(
            self.get_content(response)["created_by"], self.topic.created_by.id)


class TopicApiListTestCase(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(reverse("topic_list"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(1, len(self.get_content(response)))


class TopicApiTagListTestCase(TopicApiTestCase):

    def test_get_ok(self):
        name = "test_tag"
        self.topic.tags.add("test_tag")
        self.topic.save()
        response = self.client.get(
            reverse("topic_tag_list", kwargs={"tag": name}))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(1, len(self.get_content(response)))


class TopicApiUpdateTestCase(TopicApiTestCase):

    def test_get_ok(self):
        new_title = "new_title"
        payload = {"title": new_title}

        self.authenticate(self.user)
        response = self.client.put(
            reverse("topic_update", kwargs={"pk": self.topic.id}),
            data=payload)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(self.get_content(response)["title"], new_title)


class ActionListByTopic(TopicApiTestCase):

    def test_get_ok(self):
        ActionFactory.create(
            approved=True,
            created_by=self.user,
            topic=self.topic)
        response = self.client.get(
            reverse("topic_action_list", kwargs={"pk": self.topic.id}))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(self.get_content(response)), 1)


class TopicListByUser(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(
            reverse("user_topics", kwargs={"pk": self.user.id}))
        content = self.get_content(response)
        self.assertEqual(len(content), 1)


class TopicPost(TopicApiTestCase):

    def test_post_ok(self):
        payload = {
            "article_link": "http://test.com/",
            "scope": "something",
            "scope": random.choice(["local", "national", "worldwide"]),
            "title": "test",
            "description": "testing",
            "tags": '["test_tag"]'
        }
        self.authenticate()
        response = self.client.post(reverse("topic_create"), data=payload)
        self.assertEqual(response.status_code, 201)


class TopicByScope(TopicApiTestCase):

    def test_get_ok(self):
        pass
