# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import taggit.managers
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0002_auto_20150616_2121'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Action',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', auto_created=True, serialize=False)),
                ('title', models.CharField(max_length=512)),
                ('description', models.TextField()),
                ('article_link', models.TextField(validators=[django.core.validators.URLValidator()])),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('image', models.ImageField(blank=True, max_length=512, upload_to='static', null=True)),
                ('image_url', models.URLField()),
                ('zip', models.CharField(max_length=10)),
                ('scope', models.CharField(choices=[('local', 'Local'), ('national', 'National'), ('worldwide', 'Worldwide')], max_length=9)),
                ('rating_likes', models.PositiveIntegerField(blank=True, default=0, editable=False)),
                ('rating_dislikes', models.PositiveIntegerField(blank=True, default=0, editable=False)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('tags', taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', through='taggit.TaggedItem', to='taggit.Tag', verbose_name='Tags')),
            ],
        ),
        migrations.CreateModel(
            name='Topic',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', auto_created=True, serialize=False)),
                ('title', models.CharField(max_length=512)),
                ('article_link', models.TextField(validators=[django.core.validators.URLValidator()])),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('image', models.ImageField(blank=True, max_length=512, upload_to='static', null=True)),
                ('image_url', models.URLField()),
                ('scope', models.CharField(choices=[('local', 'Local'), ('national', 'National'), ('worldwide', 'Worldwide')], max_length=9)),
                ('zip', models.CharField(max_length=10)),
                ('rating_likes', models.PositiveIntegerField(blank=True, default=0, editable=False)),
                ('rating_dislikes', models.PositiveIntegerField(blank=True, default=0, editable=False)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('tags', taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', through='taggit.TaggedItem', to='taggit.Tag', verbose_name='Tags')),
            ],
        ),
        migrations.AddField(
            model_name='action',
            name='topic',
            field=models.ForeignKey(to='topics.Topic'),
        ),
    ]
