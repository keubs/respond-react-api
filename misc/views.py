import jwt
import requests

from django.shortcuts import render
from django.core.files import File
from django.core.files.temp import NamedTemporaryFile

from .serializers import UserSerializer

def jwt_response_payload_handler(token, user=None, request=None):

    return {
        'token': token,
        'user': UserSerializer(user).data
    }


def save_image_from_url(model, url):
    r = requests.get(url)
    from urllib import parse
    filename = parse.urlparse(url).path.split('/')[-1]
    img_temp = NamedTemporaryFile(delete=True)
    img_temp.write(r.content)
    img_temp.flush()
    model.image.save("image.jpg", File(img_temp), save=True)
