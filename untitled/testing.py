from io import BytesIO
import json
from PIL import Image
import sys

from django.core.files.uploadedfile import InMemoryUploadedFile
from django.core.urlresolvers import reverse

from rest_framework.test import APITestCase

from customuser.factories import CustomUserFactory


class BaseAPITestCase(APITestCase):

    def authenticate(self, user=None):
        '''
        Creates and then authenticates a new user.
        '''
        if user is None:
            user = CustomUserFactory.create()

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

    def dump_response(self, response):
        print("{0}".format(self.get_content(response)))

    def get_content(self, response):
        return json.loads(response.content.decode("utf-8"))
