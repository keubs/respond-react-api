import json

from django.core.urlresolvers import reverse

from untitled.testing import BaseAPITestCase


class MiscApiTokenUserTestCase(BaseAPITestCase):

    # @todo this doesn't create or update anything, so it should probably use GET
    # instead of POST
    def test_post_ok(self):
        user = self.authenticate()
        response = self.client.post(reverse("token_user"), data={})
        self.assertEqual(response.status_code, 200)
        user_id = json.loads(response.content.decode("utf-8"))["user_id"]
        self.assertEqual(user.id, user_id)
