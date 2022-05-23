from unicodedata import name
from django.db import models
from django.forms import CharField

# Create your models here.
class Usuarios(models.Model):
    nombre=models.CharField(max_length=50)
    area=models.CharField(max_length=50)    



class Estado(models.Model):
    detalle=models.CharField(max_length=50)

class Solicitud(models.Model):
    fecha=models.DateField()
    entregado=models.DecimalField(max_digits=19,decimal_places=2)
    ingreso=models.DecimalField(max_digits=19,decimal_places=2)
    gasto=models.DecimalField(max_digits=19,decimal_places=2)
    idEstado=models.PositiveIntegerField()


