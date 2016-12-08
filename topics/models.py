from django.conf import settings
from django.db import models
from customuser.models import CustomUser
from django.core.validators import URLValidator

from updown.fields import RatingField
from taggit.managers import TaggableManager
from address.models import AddressField
from imagekit.models import ImageSpecField
from imagekit.processors import ResizeToFill


class Topic(models.Model):
    SCOPE_CHOICES = [
        (u'local', u'Local'),
        (u'national', u'National'),
        (u'worldwide', u'Worldwide'),
    ]
    title = models.CharField(max_length=512)
    description = models.TextField()
    article_link = models.TextField(validators=[URLValidator()])
    created_by = models.ForeignKey(CustomUser)
    created_on = models.DateTimeField(auto_now_add=True)
    rating = RatingField(can_change_vote=True)
    tags = TaggableManager()
    image = models.ImageField(
        upload_to='media', max_length=512, null=True, default="media/logo-color.png")
    topic_thumbnail = ImageSpecField(
        source='image',
        processors=[ResizeToFill(404, 227)],
        format='JPEG',
        options={'quality': 100})

    image_url = models.URLField(max_length=512, null=True, blank=True, default=settings.MEDIA_URL + "media/logo-color.png")
    scope = models.CharField(
        choices=SCOPE_CHOICES,
        max_length=9,
    )
    address = AddressField(null=True)

    def __str__(self):
        return str(self.title)

    def save(self, *args, **kwargs):
        if self.image_url == '':
            self.image_url = self._meta.get_field('image_url').get_default()
        super(Topic, self).save(*args, **kwargs)


class Action(models.Model):
    SCOPE_CHOICES = [
        (u'local', u'Local'),
        (u'national', u'National'),
        (u'worldwide', u'Worldwide'),
    ]
    RESPOND_REACT = [
        (u'respond', 'Respond'),
        (u'react', 'React'),
    ]
    title = models.CharField(max_length=512)
    description = models.TextField()
    article_link = models.TextField(validators=[URLValidator()])
    created_by = models.ForeignKey(CustomUser)
    created_on = models.DateTimeField(auto_now_add=True)
    start_date_time = models.DateTimeField(null=True)
    end_date_time = models.DateTimeField(null=True)
    topic = models.ForeignKey(Topic)
    rating = RatingField(can_change_vote=True)
    tags = TaggableManager()
    image = models.ImageField(upload_to='media', max_length=512, blank=True, null=True)
    image_url = models.URLField(max_length=512, null=True, blank=True, default=settings.MEDIA_URL + "media/logo-color.png")
    scope = models.CharField(
        choices=SCOPE_CHOICES,
        max_length=9,
    )
    respond_react = models.CharField(
        choices=RESPOND_REACT,
        max_length=7,
        null=True
    )
    address = AddressField(null=True)
    approved = models.BooleanField(default=False)

    def __str__(self):
        return str(self.title)

    def save(self, *args, **kwargs):
        if self.image_url == '':
            self.image_url = self._meta.get_field('image_url').get_default()
        super(Action, self).save(*args, **kwargs)
