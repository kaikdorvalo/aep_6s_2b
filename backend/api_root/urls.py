from django.contrib import admin
from django.urls import path, include
from api_rest import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('check', views.get_password_strength, name='get_password_strength')
]
