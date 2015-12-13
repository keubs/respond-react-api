from django.core.files import File
from django.db import models
from django.contrib.auth.models import User
from django.core.validators import URLValidator

from updown.fields import RatingField
from taggit.managers import TaggableManager
from django.core.files import File
from pprint import pprint
class Topic(models.Model):
    title = models.CharField(max_length=512)
    article_link = models.TextField(validators=[URLValidator()])
    created_by = models.ForeignKey(User)
    created_on = models.DateTimeField(auto_now_add=True)
    rating = RatingField(can_change_vote=True)
    tags = TaggableManager()
    image = models.ImageField(upload_to='static', max_length=512, blank=True, null=True)
    image_url = models.URLField()

    def __str__(self):
        return self.id

class Action(models.Model):
    title = models.CharField(max_length=512)
    description = models.TextField()
    article_link = models.TextField(validators=[URLValidator()])
    created_by = models.ForeignKey(User)
    created_on = models.DateTimeField(auto_now_add=True)
    topic = models.ForeignKey(Topic)
    rating = RatingField(can_change_vote=True)
    tags = TaggableManager()
    image = models.ImageField(upload_to='static', max_length=512, blank=True, null=True)
    image_url = models.URLField()

    def __str__(self):
        return self.id