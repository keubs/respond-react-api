from django.core.urlresolvers import reverse

from .factories import LinkFactory, LinkTypeFactory
from untitled.testing import BaseAPITestCase


class ProcessLinkTestCase(BaseAPITestCase):

    def test_post_ok(self):
        url = "http://test.com"
        link0 = LinkFactory.create(preg=url)
        link1 = LinkFactory.create()
        LinkTypeFactory.create(link=link0)
        LinkTypeFactory.create(link=link1)
        payload = {"url": url}

        self.authenticate()
        response = self.client.post(reverse("link_factory"), data=payload)
        # @todo not sure why this post returns a 200 when creating a record
        # instead of a 201
        self.assert_get_ok(response, count=1)
