import jwt
import requests
import logging
import uuid
import os

from django.shortcuts import render
from django.core.files import File
from django.core.files.temp import NamedTemporaryFile

from .serializers import UserSerializer
from urllib import parse

def jwt_response_payload_handler(token, user=None, request=None):

    return {
        'token': token,
        'user': UserSerializer(user).data
    }


def save_image_from_url(model, url):
    logger = logging.getLogger(__name__)

    r = requests.get(url)
    # filename = parse.urlparse(url).path.split('/')[-1]
    img_temp = NamedTemporaryFile(delete=True)
    img_temp.write(r.content)
    img_temp.flush()
    filename, file_extension = os.path.splitext(url)
    model.image.save(str(uuid.uuid1()) + '.' + file_extension, File(img_temp), save=True)
