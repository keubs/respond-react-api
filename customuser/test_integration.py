from django.core.urlresolvers import reverse
from django.forms.models import model_to_dict

from utils.testing import BaseAPITestCase


class CustomUserViewSetTestCase(BaseAPITestCase):

    def test_get_detail_ok(self):
        obj = self.create_user()
        response = self.client.get(reverse("user_detail", kwargs={"pk": obj.id}))
        self.assert_get_ok(response)

    def test_get_list_ok(self):
        self.create_user()
        response = self.client.get(reverse("user_list"))
        self.assert_get_ok(response, count=1)

    def test_post_ok(self):
        user = self.authenticate()
        payload = model_to_dict(user)
        payload["first_name"] = "0123456789"

        response = self.client.post(
            reverse("user_update", kwargs={"pk": user.id}), data=payload)
        self.assertEqual(response.status_code, 200)
        self.assert_post_ok(response, update=True)
        self.assertEqual(
            self.get_content(response)["first_name"], payload["first_name"])
