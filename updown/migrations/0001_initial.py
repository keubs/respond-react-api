# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('contenttypes', '0002_remove_content_type_name'),
    ]

    operations = [
        migrations.CreateModel(
            name='Vote',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('object_id', models.PositiveIntegerField()),
                ('key', models.CharField(max_length=32)),
                ('score', models.SmallIntegerField(choices=[(-1, 'DISLIKE'), (1, 'LIKE')])),
                ('ip_address', models.IPAddressField()),
                ('date_added', models.DateTimeField(default=django.utils.timezone.now, editable=False)),
                ('date_changed', models.DateTimeField(default=django.utils.timezone.now, editable=False)),
                ('content_type', models.ForeignKey(to='contenttypes.ContentType', related_name='updown_votes')),
                ('user', models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, related_name='updown_votes', null=True)),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='vote',
            unique_together=set([('content_type', 'object_id', 'key', 'user', 'ip_address')]),
        ),
    ]
