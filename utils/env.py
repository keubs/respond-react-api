import os

from django.core.exceptions import ImproperlyConfigured


def get_env_var(name):
    try:
        return os.environ[name]
    except KeyError:
        try:
            from conf import CONF
            return CONF[name]
        except (KeyError, Exception):
            raise ImproperlyConfigured(
                'The {0} environment variable must be defined.'.format(name))
