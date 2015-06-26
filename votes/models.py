from django.db import models
from django.contrib.auth.models import User

from topics.models import Topic

class Vote(models.Model):
    user = models.ForeignKey(User)
    topic = models.ForeignKey(Topic)
    created_on = models.DateTimeField(auto_now_add=True)
    vote = models.IntegerField()
# Create your models here.
