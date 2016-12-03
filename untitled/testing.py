import json

from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password
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
