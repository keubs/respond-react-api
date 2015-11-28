from django.db import models
from django.contrib.auth.models import User
from django.core.validators import URLValidator

from updown.fields import RatingField
from taggit.managers import TaggableManager

class Topic(models.Model):
    title = models.CharField(max_length=512)
    article_link = models.TextField(validators=[URLValidator()])
    created_by = models.ForeignKey(User)
    created_on = models.DateTimeField(auto_now_add=True)
    rating = RatingField(can_change_vote=True)
    tags = TaggableManager()
    image = models.ImageField(upload_to='static', max_length=512)
    def __str__(self):
        return self.title

class Action(models.Model):
    title = models.CharField(max_length=512)
    description = models.TextField()
    article_link = models.TextField(validators=[URLValidator()])
    created_by = models.ForeignKey(User)
    created_on = models.DateTimeField(auto_now_add=True)
    topic = models.ForeignKey(Topic)
    rating = RatingField(can_change_vote=True)
    tags = TaggableManager()
    image = models.ImageField(upload_to='static', max_length=512)

    def __str__(self):
        return self.title