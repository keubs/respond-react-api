from django.core.urlresolvers import reverse
from django.forms.models import model_to_dict

from .factories import AddressFactory
from utils.testing import BaseAPITestCase


class AddressListTestCase(BaseAPITestCase):

    def test_get_list_ok(self):
        AddressFactory.create()
        response = self.client.get(reverse("address_list"))
        self.assert_get_ok(response, count=1)

    def test_get_detail_ok(self):
        obj = AddressFactory.create()
        response = self.client.get(reverse("address_detail", kwargs={"pk": obj.id}))
        self.assert_get_ok(response)


class AddressPostTestCase(BaseAPITestCase):

    def test_post_create_ok(self):
        payload = AddressFactory.attributes()
        response = self.client.post(reverse("address_create_update"), data=payload)
        self.assert_post_ok(response)

    def test_post_update_ok(self):
        obj = AddressFactory.create()
        payload = model_to_dict(obj)
        payload["latitude"] = 11.0
        response = self.client.post(reverse("address_create_update"), data=payload)
        self.assert_post_ok(response)
        self.assertEqual(
            self.get_content(response)["latitude"], payload["latitude"])
