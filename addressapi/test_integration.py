import json

from django.core.urlresolvers import reverse
from django.forms.models import model_to_dict

from .factories import AddressFactory
from untitled.testing import BaseAPITestCase


class AddressListTestCase(BaseAPITestCase):

    def test_get_list_ok(self):
        AddressFactory.create()
        response = self.client.get(reverse("address_list"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(json.loads(response.content.decode("utf-8"))), 1)

    def test_get_detail_ok(self):
        obj = AddressFactory.create()
        response = self.client.get(reverse("address_detail", kwargs={"pk": obj.id}))
        self.assertEqual(response.status_code, 200)


class AddressPostTestCase(BaseAPITestCase):

    def test_post_create_ok(self):
        payload = AddressFactory.attributes()
        response = self.client.post(reverse("address_create_update"), data=payload)
        self.assertEqual(response.status_code, 201)

    def test_post_update_ok(self):
        obj = AddressFactory.create()
        payload = model_to_dict(obj)
        payload["latitude"] = 11.0
        response = self.client.post(reverse("address_create_update"), data=payload)
        self.assertEqual(response.status_code, 201)
        latitude = json.loads(response.content.decode("utf-8"))["latitude"]
        self.assertEqual(latitude, payload["latitude"])
