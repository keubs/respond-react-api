from django.db import models
from django.core.validators import URLValidator
# Create your models here.
class LinkType(models.Model):
    linktype = models.CharField(max_length=512)

    def __str__(self):
        return str(self.linktype)


class Link(models.Model):
    link_type = models.ForeignKey(LinkType)
    domain = models.TextField(validators=[URLValidator()], unique=True)
    preg = models.CharField(max_length=512)

    def __str__(self):
        return str(self.domain)