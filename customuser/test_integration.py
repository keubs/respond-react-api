from django.core.urlresolvers import reverse
from django.forms.models import model_to_dict

from .factories import CustomUserFactory
from untitled.testing import BaseAPITestCase


class UserListTestCase(BaseAPITestCase):

    def test_get_ok(self):
        CustomUserFactory.create()
        response = self.client.get(reverse("user_list"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(self.get_content(response)), 1)


class UserUpdateTestCase(BaseAPITestCase):

    def test_post_ok(self):
        user = self.authenticate()
        payload = model_to_dict(user)
        payload["first_name"] = "0123456789"

        response = self.client.post(
            reverse("user_update", kwargs={"pk": user.id}), data=payload)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(
            self.get_content(response)["first_name"], payload["first_name"])


class UserDetailTestCase(BaseAPITestCase):

    def test_get_ok(self):
        obj = CustomUserFactory.create()
        response = self.client.get(reverse("user_detail", kwargs={"pk": obj.id}))
        self.assertEqual(response.status_code, 200)
