import json

from django.core.urlresolvers import reverse

from .factories import LinkFactory, LinkTypeFactory
from untitled.testing import BaseAPITestCase


class LinkFactoryApiTestCase(BaseAPITestCase):

    def test_post_ok(self):
        url = "http://test.com"
        link0 = LinkFactory.create(preg=url)
        link1 = LinkFactory.create()
        LinkTypeFactory.create(link=link0)
        LinkTypeFactory.create(link=link1)
        payload = {"url": url}

        self.authenticate()
        response = self.client.post(reverse("link_factory"), data=payload)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(json.loads(response.content.decode("utf-8"))), 1)
