# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('topics', '0005_action'),
    ]

    operations = [
        migrations.RenameField(
            model_name='action',
            old_name='action_link',
            new_name='article_link',
        ),
    ]
