import requests 
import unittest

answered = {'False':0,'True':0}
lista_views = []
lista_date = []
lista_reputation = []


#Funciones a utilizar, devuelven el maximo y minimo de una lista
def maximo(lista):
    mayor = lista[0]
    for i in range(0,len(lista)):
        if lista[i] > mayor:
            mayor = lista[i]
    return(mayor)

def minimo(lista):
    menor = lista[0]
    for i in range(0,len(lista)):
        if lista[i] < menor:
            menor = lista[i]
    return(menor)


def conectar():
    # Conectarse al enlace ------------------------------------------------------------------
    url = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow"
    r = requests.get(url)
    contenido = r.json()
    return contenido

def llenar_listas(data):
    indice = 0
    for i in data['items']: #Se recorren todos los objetos 
        str2 = str(data['items'][indice]['is_answered'])#Se obtiene el valor del objeto a comparar
        if str2 == "True": #Se actualiza el valor correspondiente
            answered['True'] += 1
        else:
            answered['False'] += 1
    #Llenado de las listas
        num_views = data['items'][indice]['view_count']
        lista_views.append(num_views) #Agrega el valor a la lista
        creation_date = data['items'][indice]['creation_date']
        lista_date.append(creation_date) 
        reputation = data['items'][indice]['owner']['reputation']
        lista_reputation.append(reputation)
        indice += 1
    return 0
