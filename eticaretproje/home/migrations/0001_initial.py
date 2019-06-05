# Generated by Django 2.2 on 2019-05-10 05:11

import ckeditor_uploader.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('parentid', models.IntegerField()),
                ('title', models.CharField(max_length=150)),
                ('keywords', models.CharField(blank=True, max_length=255)),
                ('description', models.CharField(blank=True, max_length=255)),
                ('image', models.ImageField(upload_to='images/')),
                ('status', models.IntegerField(choices=[(1, 'EVET'), (0, 'HAYIR')])),
                ('detail', ckeditor_uploader.fields.RichTextUploadingField()),
                ('create_at', models.DateTimeField(auto_now_add=True)),
                ('update_at', models.DateTimeField(auto_now=True)),
            ],
        ),
    ]