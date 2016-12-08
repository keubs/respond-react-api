from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password

import factory


class CustomUserFactory(factory.DjangoModelFactory):

    email = factory.Sequence(lambda n: "test-{0}@test.com".format(n))
    password = make_password("password")
    username = factory.Sequence(lambda n: "admin-{0}".format(n))

    class Meta:
        model = get_user_model()
