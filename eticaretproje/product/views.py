from django.http import Http404
from django.shortcuts import render

# Create your views here.
from product.models import Product, Category, ProductImage


def detail(request, product_id):
    try:
        product = Product.objects.get(pk=product_id)
        productimage=ProductImage.objects.filter(product_id=product_id)
        context = {
            'product': product,
            'productimage': productimage,
        }
    except Product.DoesNotExist:
        raise Http404("Product does not exist")
    return render(request, 'detail.html', context)


def vitrin(request):
    category = Category.objects.all()
    products = Product.objects.all()
    context = {
        'category': category,
        'products': products,
    }
    return render(request, 'vitrin.html', context)
