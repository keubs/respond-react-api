# from django.contrib.auth.models import User
from customuser.models import CustomUser
from rest_framework import serializers

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('password', 'first_name', 'last_name', 'email', 'username', 'id', 'zip',)
        write_only_fields = ('password',)
        read_only_fields = ('is_staff', 'is_superuser', 'is_active', 'date_joined','id', 'zip',)