from .base import *

ALLOWED_HOSTS = ["api.respondreact.com", "dev.respondreact.com"]

# @todo should be false in production?
CORS_ORIGIN_ALLOW_ALL = True

DEBUG = False

DEFAULT_FROM_EMAIL = "The respond/react Team <noreply@respondreact.com>"

EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"
EMAIL_HOST = get_env_var("RR_EMAIL_HOST")
EMAIL_HOST_PASSWORD = get_env_var("RR_EMAIL_HOST_PASSWORD")
EMAIL_HOST_USER = get_env_var("RR_EMAIL_HOST_USER")
EMAIL_PORT = 587
EMAIL_USE_TLS = True

LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'standard': {
            'format': '%(asctime)s [%(levelname)s] %(name)s: %(message)s'
        },
    },
    'handlers': {
        'default': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': 'logs/django_log.log',
            'maxBytes': 1024 * 1024 * 5,
            'backupCount': 5,
            'formatter': 'standard'
        },
        'request_handler': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': 'logs/django_debug.log',
            'maxBytes': 1024 * 1024 * 5,
            'backupCount': 5,
            'formatter': 'standard',
        },
        'mail_admins': {
            'level': 'ERROR',
            'class': 'django.utils.log.AdminEmailHandler',
        }
    },
    'loggers': {
        '': {
            'handlers': ['default'],
            'level': 'DEBUG',
            'propagate': True
        },
        'django.request': {
            'handlers': ['request_handler'],
            'level': 'DEBUG',
            'propagate': True
        },
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': False,
        }
    }
}

MEDIA_ROOT = SERVER_ROOT + '/media'
MEDIA_URL = 'http://media.respondreact.com/'

STATIC_ROOT = SERVER_ROOT + '/static/static'
STATIC_URL = 'http://api.respondreact.com/static/static/'
