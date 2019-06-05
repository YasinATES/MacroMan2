from django.urls import path

from . import views

app_name = 'home'
# uygulamanın adını path ile çağırmak için kullanıyoruz.


urlpatterns = [
    path('', views.index, name='index'),
    path('home/', views.index, name='index'),
    path('referans/', views.referans, name='referans'),
    path('iletisim/', views.iletisim, name='iletisim'),
    path('hakkimizda/', views.hakkimizda, name='hakkimizda'),
]
