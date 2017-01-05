# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import taggit.managers
import django.core.validators
import address.models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('address', '__first__'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('taggit', '0002_auto_20150616_2121'),
    ]

    operations = [
        migrations.CreateModel(
            name='Action',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('title', models.CharField(max_length=512)),
                ('description', models.TextField()),
                ('article_link', models.TextField(validators=[django.core.validators.URLValidator()])),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('start_date_time', models.DateTimeField(null=True, blank=True)),
                ('end_date_time', models.DateTimeField(null=True, blank=True)),
                ('image', models.ImageField(max_length=512, null=True, upload_to='media', blank=True)),
                ('image_url', models.URLField(max_length=512, null=True, default='http://media.respondreact.com:3100/media/logo-color.png', blank=True)),
                ('scope', models.CharField(max_length=9, choices=[('local', 'Local'), ('national', 'National'), ('worldwide', 'Worldwide')])),
                ('respond_react', models.CharField(max_length=7, null=True, choices=[('respond', 'Respond'), ('react', 'React')], blank=True)),
                ('approved', models.BooleanField(default=False)),
                ('rating_likes', models.PositiveIntegerField(default=0, editable=False, blank=True)),
                ('rating_dislikes', models.PositiveIntegerField(default=0, editable=False, blank=True)),
                ('address', address.models.AddressField(to='address.Address', null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('tags', taggit.managers.TaggableManager(to='taggit.Tag', through='taggit.TaggedItem', verbose_name='Tags', help_text='A comma-separated list of tags.')),
            ],
        ),
        migrations.CreateModel(
            name='Topic',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('title', models.CharField(max_length=512)),
                ('description', models.TextField()),
                ('article_link', models.TextField(validators=[django.core.validators.URLValidator()])),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('image', models.ImageField(max_length=512, null=True, upload_to='media', default='media/logo-color.png')),
                ('image_url', models.URLField(max_length=512, null=True, default='http://media.respondreact.com:3100/media/logo-color.png', blank=True)),
                ('scope', models.CharField(max_length=9, choices=[('local', 'Local'), ('national', 'National'), ('worldwide', 'Worldwide')])),
                ('rating_likes', models.PositiveIntegerField(default=0, editable=False, blank=True)),
                ('rating_dislikes', models.PositiveIntegerField(default=0, editable=False, blank=True)),
                ('address', address.models.AddressField(to='address.Address', null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('tags', taggit.managers.TaggableManager(to='taggit.Tag', through='taggit.TaggedItem', verbose_name='Tags', help_text='A comma-separated list of tags.')),
            ],
        ),
        migrations.AddField(
            model_name='action',
            name='topic',
            field=models.ForeignKey(to='topics.Topic'),
        ),
    ]
