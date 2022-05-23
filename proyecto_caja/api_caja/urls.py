from django.urls import path
from .views import UsuarioVista,EstadoVista

urlpatterns=[
    path('usuarios/', UsuarioVista.as_view(), name='lista_usuarios'),
    path('usuarios/<int:id>', UsuarioVista.as_view() , name='lista_usuario'),
    path('estado/', EstadoVista.as_view(), name='lista_estados'),
    path('estado/<int:id>', EstadoVista.as_view() , name='lista_estado')
]