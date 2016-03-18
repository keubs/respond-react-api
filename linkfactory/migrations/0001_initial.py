# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Link',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('domain', models.TextField(unique=True, validators=[django.core.validators.URLValidator()])),
                ('preg', models.CharField(max_length=512)),
            ],
        ),
        migrations.CreateModel(
            name='LinkType',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('type', models.CharField(max_length=512)),
            ],
        ),
        migrations.AddField(
            model_name='link',
            name='link_type',
            field=models.ForeignKey(to='linkfactory.LinkType'),
        ),
    ]
