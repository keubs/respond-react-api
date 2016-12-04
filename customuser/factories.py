from django.contrib.auth import get_user_model

import factory


class CustomUserFactory(factory.DjangoModelFactory):

    email = factory.Sequence(lambda n: "test-{0}@test.com".format(n))
    password = "password"
    username = factory.Sequence(lambda n: "admin-{0}".format(n))

    class Meta:
        model = get_user_model()
