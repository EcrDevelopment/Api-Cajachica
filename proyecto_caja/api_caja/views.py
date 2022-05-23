from django.http import JsonResponse
from django.views import View
from .models import Usuarios,Estado

from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
import json


# Create your views here.
class UsuarioVista(View):

    @method_decorator(csrf_exempt)
    def dispatch(self,request,*args,** kwargs):
        return super().dispatch(request,*args,** kwargs)

    def get(self,request,id=0):
        if(id>0):
            usuarios=list(Usuarios.objects.filter(id=id).values())
            if len(usuarios)>0:
                usuario=usuarios[0]
                datos={'mensaje':'Correcto','usuario':usuario}
            else:                
                 datos={'mensaje':'Usuario no encontrado'}
            return JsonResponse(datos)
        else:
            usuarios=list(Usuarios.objects.values())
            if len(usuarios)>0:
                datos={'mensaje':'usuarios listados','usuarios':usuarios}
            else:
                datos={'mensaje':'Usuarios no encontrados'}
            return JsonResponse(datos)

    def post(self,request):
        jd=json.loads(request.body)
        Usuarios.objects.create(nombre=jd['nombre'],area=jd['area'])
        datos={'mensaje':'Usuario agregado correctamente'}
        return JsonResponse(datos)


    def put(self,request,id):
        jd=json.loads(request.body)
        usuarios=list(Usuarios.objects.filter(id=id).values())
        if len(usuarios)>0:
            usuario=Usuarios.objects.get(id=id)
            usuario.nombre=jd['nombre']
            usuario.area=jd['area']
            usuario.save()
            datos={'mensaje':'Se actualizo correctamente el usuario'}
        else:
            datos={'mensaje':'Usuario no encontrado'}
        return JsonResponse(datos)

    def delete(self,request,id):
        usuarios=list(Usuarios.objects.filter(id=id).values())
        if len(usuarios)>0:
            Usuarios.objects.filter(id=id).delete()
            datos={'mensaje':'Se elimino correctamente el usuario'}
        else:
            datos={'mensaje':'Usuario no encontrado'}
        return JsonResponse(datos)

class EstadoVista(View):
    @method_decorator(csrf_exempt)
    def dispatch(self,request,*args,** kwargs):
        return super().dispatch(request,*args,** kwargs)

    def get(self,request,id=0):
        if(id>0):
            estados=list(Estado.objects.filter(id=id).values())
            if len(estados)>0:
                estado=estados[0]
                datos={'mensaje':'Correcto','estado':estado}
            else:                
                 datos={'mensaje':'estado no encontrado'}
            return JsonResponse(datos)
        else:
            estados=list(Estado.objects.values())
            if len(estados)>0:
                datos={'mensaje':'estados listados','usuarios':estados}
            else:
                datos={'mensaje':'estados no encontrados'}
            return JsonResponse(datos)

    def post(self,request):
        jd=json.loads(request.body)
        Estado.objects.create(nombre=jd['detalle'])
        datos={'mensaje':'Usuario agregado correctamente'}
        return JsonResponse(datos)


    def put(self,request,id):
        jd=json.loads(request.body)
        estados=list(Estado.objects.filter(id=id).values())
        if len(estados)>0:
            estado=Estado.objects.get(id=id)
            estado.detalle=jd['detalle']            
            estado.save()
            datos={'mensaje':'Se actualizo correctamente el detalle'}
        else:
            datos={'mensaje':'Usuario no encontrado'}
        return JsonResponse(datos)

    def delete(self,request,id):
        estados=list(Estado.objects.filter(id=id).values())
        if len(estados)>0:
            Estado.objects.filter(id=id).delete()
            datos={'mensaje':'Se elimino correctamente el estado'}
        else:
            datos={'mensaje':'Usuario no encontrado'}
        return JsonResponse(datos)