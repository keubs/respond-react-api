# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.core.validators
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('topics', '0004_auto_20151013_1459'),
    ]

    operations = [
        migrations.CreateModel(
            name='Action',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('title', models.CharField(max_length=512)),
                ('description', models.TextField()),
                ('action_link', models.TextField(validators=[django.core.validators.URLValidator()])),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('rating_likes', models.PositiveIntegerField(default=0, blank=True, editable=False)),
                ('rating_dislikes', models.PositiveIntegerField(default=0, blank=True, editable=False)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('topic', models.ForeignKey(to='topics.Topic')),
            ],
        ),
    ]
