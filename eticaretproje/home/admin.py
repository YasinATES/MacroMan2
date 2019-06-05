from ckeditor_uploader.fields import RichTextUploadingField
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django import forms
from django.contrib import admin

# Register your models here.
from home.models import PageDetail, Kampanya, Footer


class ModelClass:
    ## content = models.TextField()
    detail = RichTextUploadingField()

class PostForm(forms.ModelForm):
    detail = forms.CharField(widget=CKEditorUploadingWidget())


admin.site.register(Kampanya)
admin.site.register(Footer)
admin.site.register(PageDetail)
