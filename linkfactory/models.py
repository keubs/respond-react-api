from django.db import models
from django.core.validators import URLValidator

class Link(models.Model):
    domain = models.URLField(max_length=512)
    preg = models.CharField(max_length=512)

    def __str__(self):
        return str(self.domain)

class LinkType(models.Model):
    linktype = models.CharField(max_length=512)
    link = models.ForeignKey(Link)
    
    def __str__(self):
        return str(self.linktype)