from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt import utils

from updown.views import AddRatingFromModel
from customuser.models import CustomUser


class RatingPost(APIView):
    permission_classes = (IsAuthenticated, )
    authentication_classes = (JSONWebTokenAuthentication, )

    def post(self, request, model, app_label, object_id, field_name, score, **kwargs):
        user = utils.jwt_decode_handler(request.auth)['user_id']

        user = CustomUser.objects.get(id=user)

        addRating = AddRatingFromModel()

        return addRating(request, model, app_label, object_id, field_name, score, user)
