from django.urls import path

from . import views

app_name = 'product'
# uygulamanın adını path ile çağırmak için kullanıyoruz.


urlpatterns = [
    path('<int:product_id>/', views.detail, name='index'),
    path('', views.vitrin, name='vitrin'),
]

