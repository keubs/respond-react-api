# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('topics', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='action',
            name='image_url',
            field=models.URLField(null=True, default='http://media.respondreact.com/media/logo-color.png', blank=True, max_length=512),
        ),
        migrations.AlterField(
            model_name='topic',
            name='image_url',
            field=models.URLField(null=True, default='http://media.respondreact.com/media/logo-color.png', blank=True, max_length=512),
        ),
    ]
