from .base import *

ALLOWED_HOSTS = ["api.respondreact.com", "dev.respondreact.com"]

CORS_ORIGIN_WHITELIST = ("respondreact.com",)

DEBUG = False

DEFAULT_FROM_EMAIL = "The respond/react Team <noreply@respondreact.com>"

EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"
EMAIL_HOST = get_env_var("RR_EMAIL_HOST")
EMAIL_HOST_PASSWORD = get_env_var("RR_EMAIL_HOST_PASSWORD")
EMAIL_HOST_USER = get_env_var("RR_EMAIL_HOST_USER")
EMAIL_PORT = 587
EMAIL_USE_TLS = True

STATIC_ROOT = SERVER_ROOT + '/static'
STATIC_URL = 'http://api.respondreact.com/static/'
