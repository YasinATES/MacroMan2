from ckeditor_uploader.fields import RichTextUploadingField
from django.db import models


# Create your models here.
class PageDetail(models.Model):
    STATUS = (
        (1, 'EVET'),
        (0, 'HAYIR'),
    )
    title = models.CharField(max_length=150)
    keywords = models.CharField(max_length=255, blank=True)
    description = models.CharField(max_length=255, blank=True)
    image = models.ImageField(upload_to='images/')
    status = models.IntegerField(choices=STATUS)
    detailone = RichTextUploadingField()
    detailtwo = RichTextUploadingField()
    detailthree = RichTextUploadingField()
    create_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title


class Kampanya(models.Model):
    title = models.CharField(max_length=150)
    baslikbir = models.CharField(max_length=150)
    baslikiki = models.CharField(max_length=150)
    yazibir = models.CharField(max_length=150)
    yaziiki = models.CharField(max_length=150)
    yaziuc = models.CharField(max_length=150)
    yazidort = models.CharField(max_length=150)
    indirim = models.CharField(max_length=150)
    create_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title


class Footer(models.Model):
    title = models.CharField(max_length=150)
    sirketadi = models.CharField(max_length=150)
    adres = models.CharField(max_length=150)
    telefon = models.CharField(max_length=150)
    mail = models.CharField(max_length=150)
    sosyalmedya = models.CharField(max_length=150)
    hakkimizdakisa = models.CharField(max_length=150)
    haberbir = models.CharField(max_length=150)
    haberesimbir = models.ImageField(upload_to='images/')
    tarihbir = models.CharField(max_length=150)
    haberiki = models.CharField(max_length=150)
    tarihiki = models.CharField(max_length=150)
    haberresimiki = models.ImageField(upload_to='images/')
    create_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title
