
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include


from eticaretproje import settings

urlpatterns = [
    path('', include('home.urls')),
    path('home/', include('home.urls')),
    path('referan/', include('home.urls')),
    path('iletisim/', include('home.urls')),
    path('hakkimizda/', include('home.urls')),
    path('product/', include('product.urls')),
    path('vitrin/', include('product.urls')),
    path('admin/', admin.site.urls),
    path('ckeditor/', include('ckeditor_uploader.urls')),
] +static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
