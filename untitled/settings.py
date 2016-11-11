"""
Django settings for untitled project.

Generated by 'django-admin startproject' using Django 1.8.2.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.8/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
import datetime

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

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.8/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = get_env_var('SECRET_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

# BUILDING variable allows you to not need JWT tokens
BUILDING = False

ALLOWED_HOSTS = [
    '127.0.0.1:8000',
    '.keubs.webfaction.com',
    'respondreact.com',
    'api.respondreact.com',
]


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'rest_framework.authtoken',
    'corsheaders',
    'topics',
    'updown',
    'taggit',
    'customuser',
    'taggit_serializer',
    'opengraph',
    'social.apps.django_app.default',
    'rest_social_auth',
    'address',
    'addressapi',
    'sendemail',
)

TEMPLATE_CONTEXT_PROCESSORS = (
    # OAuth
    'social.apps.django_app.context_processors.backends',
    'social.apps.django_app.context_processors.login_redirect',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    # 'misc.middleware.SocialAuthExceptionMiddleware',
)



ROOT_URLCONF = 'untitled.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'untitled.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#     },
# }

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', 
        'NAME': get_env_var('DB_NAME'),
        'USER': get_env_var('DB_USER'),
        'PASSWORD': get_env_var('DB_PASSWORD'),
        # 'ENGINE': 'django.db.backends.mysql',
        # 'NAME': 'respondreact',
        # 'USER': 'root',
        # 'PASSWORD': 'root',
        'HOST': 'localhost',   # Or an IP Address that your DB is hosted on
        'PORT': '3306',
    }
}

CORS_ORIGIN_WHITELIST = (
    'localhost:3000',
)

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.AllowAny',
    ),
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
    ),

    'DEFAULT_PARSER_CLASSES': (
        'rest_framework.parsers.JSONParser',
        'rest_framework.parsers.MultiPartParser',
        'rest_framework.parsers.FileUploadParser',
    ),
}

AUTHENTICATION_BACKENDS = {
    # Django
    'django.contrib.auth.backends.ModelBackend',

    # Facebook OAuth2
    'social.backends.facebook.FacebookAppOAuth2',
    'social.backends.facebook.FacebookOAuth2',

    # Google Oauth2
    'social.backends.google.GoogleOAuth2',

    # Twitter
    'social.backends.twitter.TwitterOAuth',  # OAuth1.0

}

# Facebook configuration
SOCIAL_AUTH_FACEBOOK_KEY = get_env_var('SOCIAL_AUTH_FACEBOOK_KEY')
SOCIAL_AUTH_FACEBOOK_SECRET = get_env_var('SOCIAL_AUTH_FACEBOOK_SECRET')

# Google configuration
SOCIAL_AUTH_GOOGLE_OAUTH2_KEY = get_env_var('SOCIAL_AUTH_GOOGLE_OAUTH2_KEY')
SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET = get_env_var('SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET')

# Twitter configuration
SOCIAL_AUTH_TWITTER_KEY = get_env_var('SOCIAL_AUTH_TWITTER_KEY')
SOCIAL_AUTH_TWITTER_SECRET = get_env_var('SOCIAL_AUTH_TWITTER_SECRET')

# NY Times configuration
NY_TIMES_API_KEY = get_env_var('NY_TIMES_API_KEY')

# Define SOCIAL_AUTH_FACEBOOK_SCOPE to get extra permissions from facebook. Email is not sent by default, to get it, you must request the email permission:
SOCIAL_AUTH_FACEBOOK_SCOPE = ['email']
SOCIAL_AUTH_GOOGLE_OAUTH2_SCOPE = ['email']

SOCIAL_AUTH_ENABLED_BACKENDS = ('facebook', 'google')

SOCIAL_AUTH_FACEBOOK_PROFILE_EXTRA_PARAMS = {
  'fields': 'id, name, email'
}

SOCIAL_AUTH_USER_MODEL = 'customuser.CustomUser'

JWT_AUTH = {
    'JWT_EXPIRATION_DELTA': datetime.timedelta(days=30),
    'JWT_RESPONSE_PAYLOAD_HANDLER': 'misc.views.jwt_response_payload_handler',
}

SOCIAL_AUTH_PIPELINE = (
    'social.pipeline.social_auth.social_details',
    'social.pipeline.social_auth.social_uid',
    'social.pipeline.social_auth.auth_allowed',
    'social.pipeline.social_auth.social_user',
    'social.pipeline.user.get_username',
    'customuser.email.email_user',
    'social.pipeline.user.create_user',
    'social.pipeline.social_auth.associate_user',
    'social.pipeline.social_auth.load_extra_data',
    'social.pipeline.user.user_details',
    'customuser.social_pipeline.save_avatar',  # custom action
)

TAGGIT_CASE_INSENSITIVE = True

AUTH_USER_MODEL = 'customuser.CustomUser'

# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/

#STATIC_URL = '/static/'
STATIC_URL = 'http://respondreact.keubs.webfactional.com/static/'

STATICFILES_DIRS = (
    '/home/keubs/webapps/static/static',
)

STATIC_ROOT = '/home/keubs/webapps/static'

MEDIA_URL = ''
MEDIA_ROOT = '/home/keubs/webapps/media'

# @TODO eventually get whitelists working
CORS_ORIGIN_ALLOW_ALL = True
CORS_ALLOW_CREDENTIALS = False
CORS_ORIGIN_WHITELIST = (
    'http://squ.ad:3000',
    'http://squ.ad:8100',
    'http://respondreact.com:3000',
    'http://respondreact.com',
    'http://respondreact.com:8100',
    'http://api.respondreaact.com',
)

# EMAIL_HOST = '127.0.0.1'
# EMAIL_HOST_USER = ''
# EMAIL_HOST_PASSWORD = ''
# EMAIL_PORT = 1025
# EMAIL_USE_TLS = False
EMAIL_USE_TLS = True
DEFAULT_FROM_EMAIL = 'The respond/react Team <noreply@respondreact.com>'
EMAIL_HOST = get_env_var('EMAIL_HOST')
EMAIL_HOST_USER = get_env_var('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = get_env_var('EMAIL_HOST_PASSWORD')
EMAIL_PORT = 587
