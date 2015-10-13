# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('topics', '0003_auto_20150928_2140'),
    ]

    operations = [
        migrations.AlterField(
            model_name='topic',
            name='title',
            field=models.CharField(max_length=512),
        ),
    ]
