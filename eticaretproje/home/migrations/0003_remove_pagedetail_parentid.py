# Generated by Django 2.2 on 2019-05-10 05:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0002_auto_20190510_0814'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='pagedetail',
            name='parentid',
        ),
    ]
