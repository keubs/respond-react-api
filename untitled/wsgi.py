"""
WSGI config for untitled project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

from utils.env import get_env_var

os.environ.setdefault(
    "DJANGO_SETTINGS_MODULE",
    "untitled.settings.{0}".format(get_env_var("RR_APP_MODE")))

application = get_wsgi_application()
