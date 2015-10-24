# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import topics.models


class Migration(migrations.Migration):

    dependencies = [
        ('topics', '0006_auto_20151013_1623'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=256)),
                ('object_type', models.CharField(max_length=128)),
                ('object_id', models.ForeignKey(to='topics.Topic', to_field=topics.models.Action)),
            ],
        ),
    ]
