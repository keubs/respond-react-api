# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Link',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, primary_key=True, verbose_name='ID')),
                ('domain', models.URLField(max_length=512)),
                ('preg', models.CharField(max_length=512)),
            ],
        ),
        migrations.CreateModel(
            name='LinkType',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, primary_key=True, verbose_name='ID')),
                ('linktype', models.CharField(max_length=512)),
                ('link', models.ForeignKey(to='linkfactory.Link')),
            ],
        ),
    ]
