from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class CustomUser(AbstractUser):
    social_thumb = models.URLField(null=True, blank=True)
    zip = models.CharField(max_length=10)
    def __str__(self):
        return str(self.username)