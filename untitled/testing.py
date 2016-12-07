from io import BytesIO
import json
from PIL import Image
import sys

from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.core.urlresolvers import reverse

from rest_framework.test import APITestCase


User = get_user_model()


class BaseAPITestCase(APITestCase):

    def authenticate(self):
        '''
        Creates and then authenticates a new user.
        '''

        password = make_password('password!')
        user = User.objects.create(
            email='admin@test.com',
            password=password,
            username='admin')

        response = self.client.post(reverse('jwt_token'), {
            'username': user.username,
            'password': 'password!'})

        token = json.loads(response.content.decode('utf-8'))['token']
        self.client.credentials(HTTP_AUTHORIZATION='JWT ' + token)

        return user

    def create_test_image(
            self, name="test.png", ext="png", size=(1, 1), color=(256, 0, 0)):
        image_file = BytesIO()
        image = Image.new("RGBA", size, color)
        image.save(image_file, ext)
        image_file.seek(0)
        return InMemoryUploadedFile(
            image_file, None, name, "image/png", sys.getsizeof(image_file), None)
