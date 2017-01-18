from .base import *

CORS_ORIGIN_ALLOW_ALL = True

DEBUG = True

EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"

REST_FRAMEWORK["TEST_REQUEST_DEFAULT_FORMAT"] = "json"
