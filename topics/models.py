from django.db import models
from django.contrib.auth.models import User
from django.core.validators import URLValidator

class Topic(models.Model):
    title = models.CharField(max_length=128)
    article_link = models.TextField(validators=[URLValidator()])
    created_by = models.ForeignKey(User)
    created_on = models.DateTimeField(auto_now_add=True)
# Create your models here.
