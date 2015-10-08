# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('topics', '0002_auto_20150626_1902'),
    ]

    operations = [
        migrations.AddField(
            model_name='topic',
            name='rating_dislikes',
            field=models.PositiveIntegerField(editable=False, default=0, blank=True),
        ),
        migrations.AddField(
            model_name='topic',
            name='rating_likes',
            field=models.PositiveIntegerField(editable=False, default=0, blank=True),
        ),
    ]
