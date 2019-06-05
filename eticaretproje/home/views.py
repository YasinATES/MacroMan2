from django.shortcuts import render

# Create your views here.
# def index(request):
#     context = {'page': 'home'}
#     return render(request, 'index.html',context)
from home.models import PageDetail, Kampanya, Footer
from product.models import Category, Product


def index(request):
    category = Category.objects.all()
    products = Product.objects.all()
    kampanya = Kampanya.objects.all()
    footer = Footer.objects.all()
    context = {
        'category': category,
        'products': products,
        'kampanya': kampanya,
        'footer': footer,
    }
    return render(request, 'index.html', context)


def referans(request):
    pagedetail = PageDetail.objects.all()
    footer = Footer.objects.all()
    context = {
        'pagedetail': pagedetail,
        'footer': footer,
    }
    return render(request, 'referans.html', context)

def iletisim(request):
    pagedetail = PageDetail.objects.all()
    footer = Footer.objects.all()
    context = {
        'pagedetail': pagedetail,
        'footer': footer,
    }
    return render(request, 'iletisim.html', context)


def hakkimizda(request):
    pagedetail = PageDetail.objects.all()
    footer = Footer.objects.all()
    context = {
        'pagedetail': pagedetail,
        'footer': footer,
    }
    return render(request, 'hakkimizda.html', context)
