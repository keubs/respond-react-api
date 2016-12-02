# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import address.models
import taggit.managers
import django.core.validators
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0002_auto_20150616_2121'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('address', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Action',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=512)),
                ('description', models.TextField()),
                ('article_link', models.TextField(validators=[django.core.validators.URLValidator()])),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('start_date_time', models.DateTimeField(null=True)),
                ('end_date_time', models.DateTimeField(null=True)),
                ('image', models.ImageField(null=True, blank=True, upload_to='media', max_length=512)),
                ('image_url', models.URLField(null=True, default='http://media.respondreact.com/media/logo-color.png', max_length=512)),
                ('scope', models.CharField(max_length=9, choices=[('local', 'Local'), ('national', 'National'), ('worldwide', 'Worldwide')])),
                ('respond_react', models.CharField(null=True, choices=[('respond', 'Respond'), ('react', 'React')], max_length=7)),
                ('approved', models.BooleanField(default=False)),
                ('rating_likes', models.PositiveIntegerField(editable=False, blank=True, default=0)),
                ('rating_dislikes', models.PositiveIntegerField(editable=False, blank=True, default=0)),
                ('address', address.models.AddressField(null=True, to='address.Address')),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('tags', taggit.managers.TaggableManager(verbose_name='Tags', to='taggit.Tag', help_text='A comma-separated list of tags.', through='taggit.TaggedItem')),
            ],
        ),
        migrations.CreateModel(
            name='Topic',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=512)),
                ('description', models.TextField()),
                ('article_link', models.TextField(validators=[django.core.validators.URLValidator()])),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('image', models.ImageField(null=True, upload_to='media', default='media/logo-color.png', max_length=512)),
                ('image_url', models.URLField(null=True, blank=True, default='http://media.respondreact.com/media/logo-color.png', max_length=512)),
                ('scope', models.CharField(max_length=9, choices=[('local', 'Local'), ('national', 'National'), ('worldwide', 'Worldwide')])),
                ('rating_likes', models.PositiveIntegerField(editable=False, blank=True, default=0)),
                ('rating_dislikes', models.PositiveIntegerField(editable=False, blank=True, default=0)),
                ('address', address.models.AddressField(null=True, to='address.Address')),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('tags', taggit.managers.TaggableManager(verbose_name='Tags', to='taggit.Tag', help_text='A comma-separated list of tags.', through='taggit.TaggedItem')),
            ],
        ),
        migrations.AddField(
            model_name='action',
            name='topic',
            field=models.ForeignKey(to='topics.Topic'),
        ),
    ]
