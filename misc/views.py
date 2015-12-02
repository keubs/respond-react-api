import jwt

from django.shortcuts import render

def jwt_response_payload_handler(token, user=None, request=None):

    return {
        'token': token,
        'user': UserSerializer(user).data
    }
