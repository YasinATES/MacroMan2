# Generated by Django 2.2 on 2019-05-14 12:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0004_auto_20190514_1536'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='category',
            name='parentid',
        ),
    ]
