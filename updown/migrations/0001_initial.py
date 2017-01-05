# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Vote',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('object_id', models.PositiveIntegerField()),
                ('key', models.CharField(max_length=32)),
                ('score', models.SmallIntegerField(choices=[(-1, 'DISLIKE'), (1, 'LIKE')])),
                ('ip_address', models.GenericIPAddressField()),
                ('date_added', models.DateTimeField(editable=False, default=django.utils.timezone.now)),
                ('date_changed', models.DateTimeField(editable=False, default=django.utils.timezone.now)),
                ('content_type', models.ForeignKey(related_name='updown_votes', to='contenttypes.ContentType')),
                ('user', models.ForeignKey(null=True, blank=True, related_name='updown_votes', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='vote',
            unique_together=set([('content_type', 'object_id', 'key', 'user', 'ip_address')]),
        ),
    ]
