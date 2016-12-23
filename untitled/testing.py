from io import BytesIO
import json
from PIL import Image
import sys

from django.core.files.uploadedfile import InMemoryUploadedFile
from django.core.urlresolvers import reverse

from rest_framework.test import APITestCase

from customuser.factories import CustomUserFactory


class BaseAPITestCase(APITestCase):

    def assert_delete_ok(self, response):
        self.assertEqual(response.status_code, 204)

    def assert_get_ok(self, response, **kwargs):
        count = kwargs.get("count", None)
        self.assertEqual(response.status_code, 200)
        if count is not None:
            self.assertEqual(len(self.get_content(response)), count)

    def assert_post_ok(self, response, **kwargs):
        code = 200 if kwargs.get("update", False) else 201
        self.assertEqual(response.status_code, code)

    def assert_put_ok(self, response):
        self.assertEqual(response.status_code, 200)

    def authenticate(self, user=None):
        '''
        Creates and then authenticates a new user.
        '''
        if user is None:
            user = self.create_user()

        response = self.client.post(reverse('jwt_token'), {
            'username': user.username,
            'password': "password"})

        token = json.loads(response.content.decode('utf-8'))['token']
        self.client.credentials(HTTP_AUTHORIZATION='JWT ' + token)

        return user

    def create_image(
            self, name="test.png", ext="png", size=(1, 1), color=(256, 0, 0)):
        image_file = BytesIO()
        image = Image.new("RGBA", size, color)
        image.save(image_file, ext)
        image_file.seek(0)
        return InMemoryUploadedFile(
            image_file, None, name, "image/png", sys.getsizeof(image_file), None)

    def create_user(self):
        return CustomUserFactory.create()

    def dump_response(self, response):
        print("{0}".format(self.get_content(response)))

    def get_content(self, response):
        return json.loads(response.content.decode("utf-8"))
