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

    def get_random_scope(self):
        return random.choice(["local", "national", "worldwide"])


class TopicCountTestCase(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(reverse("topic_count"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(1, self.get_content(response)["count"])


class TopicDeleteTestCase(TopicApiTestCase):

    def test_delete_ok(self):
        # @todo i'm deleting a topic with a different user than the one that
        # created the topic. bug?
        self.authenticate()
        response = self.client.delete(
            reverse("topic_delete", kwargs={"pk": self.topic.id}))
        self.assertEqual(response.status_code, 204)


class TopicDetailTestCase(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(
            reverse("topic_detail", kwargs={"pk": self.topic.id}))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(
            self.get_content(response)["created_by"], self.topic.created_by.id)


class TopicListTestCase(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(reverse("topic_list"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(1, len(self.get_content(response)))


class TopicListByTagTestCase(TopicApiTestCase):

    def test_get_ok(self):
        name = "test_tag"
        self.topic.tags.add("test_tag")
        self.topic.save()
        response = self.client.get(
            reverse("topic_tag_list", kwargs={"tag": name}))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(1, len(self.get_content(response)))


class TopicUpdateTestCase(TopicApiTestCase):

    def test_get_ok(self):
        new_title = "new_title"
        payload = {"title": new_title}

        self.authenticate(self.user)
        response = self.client.put(
            reverse("topic_update", kwargs={"pk": self.topic.id}),
            data=payload)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(self.get_content(response)["title"], new_title)


class ApproveActionTestCase(TopicApiTestCase):

    def test_post_ok(self):
        action = ActionFactory.create(
            created_by=self.user,
            topic=self.topic)
        self.authenticate()
        response = self.client.post(
            reverse("action_approve", kwargs={"pk": action.id}))
        self.assertEqual(response.status_code, 200)


class ActionPostTestCase(TopicApiTestCase):

    def test_post_ok(self):
        # @todo view throws if `topic` doesn't exist
        payload = {
            "article_link": "https://test.com",
            "description": "testing",
            "scope": self.get_random_scope(),
            "tags": ["test_tag"],
            "title": "test title",
            "topic": self.topic.id
        }
        self.authenticate()
        response = self.client.post(reverse("action_create"), data=payload)
        self.assertEqual(response.status_code, 201)


class ActionDeleteTestCase(TopicApiTestCase):

    def test_delete_ok(self):
        action = ActionFactory.create(
            created_by=self.user,
            topic=self.topic)
        self.authenticate()
        response = self.client.delete(
            reverse("action_delete", kwargs={"pk": action.id}))
        self.assertEqual(response.status_code, 204)


class ActionDetailByTopicTestCase(TopicApiTestCase):

    def test_get_ok(self):
        action = ActionFactory.create(
            created_by=self.user,
            topic=self.topic)
        response = self.client.get(
            reverse("action_topic_detail", kwargs={"pk": action.id}))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(self.get_content(response)["id"], action.id)


class ActionsForAllUserTopicsTestCase(TopicApiTestCase):

    def test_get_ok(self):
        for i in range(2):
            ActionFactory.create(
                created_by=self.user,
                topic=self.topic)
        self.authenticate(user=self.user)
        response = self.client.get(reverse("action_topic_list"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(self.get_content(response)), 2)


class ActionListTestCase(TopicApiTestCase):

    def test_get_ok(self):
        for i in range(2):
            ActionFactory.create(
                created_by=self.user,
                topic=self.topic)
        response = self.client.get(reverse("action_list"))
        # @todo abstract away the request and status code assertion
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(self.get_content(response)), 2)


class ActionListByTagTestCase(TopicApiTestCase):

    def test_get_ok(self):
        tag = "test_tag"
        for i in range(2):
            action = ActionFactory.create(
                created_by=self.user,
                topic=self.topic)
            action.tags.add(tag)
            action.save()

        response = self.client.get(
            reverse("action_tag_list", kwargs={"tag": tag}))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(self.get_content(response)), 2)


class ActionListByTopicTestCase(TopicApiTestCase):

    def test_get_ok(self):
        ActionFactory.create(
            approved=True,
            created_by=self.user,
            topic=self.topic)
        response = self.client.get(
            reverse("topic_action_list", kwargs={"pk": self.topic.id}))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(self.get_content(response)), 1)


class UnapprovedActionsTestCase(TopicApiTestCase):

    def test_post_ok(self):
        ActionFactory.create(
            approved=False,
            created_by=self.user,
            topic=self.topic)
        self.authenticate(self.user)
        response = self.client.get(reverse("action_unapproved_list"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(self.get_content(response)), 1)


class UnapprovedActionCountTestCase(TopicApiTestCase):

    def test_post_ok(self):
        ActionFactory.create(
            approved=False,
            created_by=self.user,
            topic=self.topic)
        self.authenticate(self.user)
        response = self.client.get(reverse("action_unapproved_count"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(self.get_content(response)["count"], 1)


class TopicListByUserTestCase(TopicApiTestCase):

    def test_get_ok(self):
        response = self.client.get(
            reverse("user_topics", kwargs={"pk": self.user.id}))
        content = self.get_content(response)
        self.assertEqual(len(content), 1)


class TopicPostTestCase(TopicApiTestCase):

    def test_post_ok(self):
        payload = {
            "article_link": "http://test.com/",
            "scope": self.get_random_scope(),
            "title": "test",
            "description": "testing",
            "tags": '["test_tag"]'
        }
        self.authenticate()
        response = self.client.post(reverse("topic_create"), data=payload)
        self.assertEqual(response.status_code, 201)


class TopicByScopeTestCase(TopicApiTestCase):

    def test_get_ok(self):
        pass
