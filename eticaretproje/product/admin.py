from ckeditor_uploader.fields import RichTextUploadingField
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django import forms
from django.contrib import admin

# Register your models here.
from product.models import Category, Product, ProductImage


class ImageInline(admin.TabularInline):
    model = ProductImage
    extra = 3

class ProductAdmin(admin.ModelAdmin):
    list_display = ('title', 'category', 'status')
    list_filter = ('category', 'status')
    inlines = [ImageInline]
# Liste sayfasında title category ve status göster
# filtrelemeyi de category ve status'e göre yap.


class ProductImageAdmin(admin.ModelAdmin):
    list_display = ('product', 'image', 'create_at')

class CategoryAdmin(admin.ModelAdmin):
    list_display = ('title','status')


class ModelClass:
    ## content = models.TextField()
    detail = RichTextUploadingField()

class PostForm(forms.ModelForm):
    detail = forms.CharField(widget=CKEditorUploadingWidget())

admin.site.register(Category)
admin.site.register(Product,ProductAdmin)
admin.site.register(ProductImage,ProductImageAdmin)
