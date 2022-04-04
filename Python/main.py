import requests 
# Conectarse al enlace ------------------------------------------------------------------
url = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow"
r = requests.get(url)
data = r.json()

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

answered = {'False':0,'True':0}
lista_views = []
lista_date = []
lista_reputation = []

indice=0
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

# Obtener el número de respuestas contestadas y no contestadas---------------------------------
print("\nPreguntas contestadas:", answered['True'])
print("\nPreguntas no contestadas:", answered['False'])
# Obtener la respuesta con menor número de vistas ---------------------------------------------
print("\nRespuesta con menor numero de vistas: ", minimo(lista_views))
print(data['items'][lista_views.index(minimo(lista_views))]['title'])
# Obtener la respuesta más vieja y más actual--------------------------------------------------
print("\nRespuesta mas vieja: ",minimo(lista_date))
print(data['items'][lista_date.index(minimo(lista_date))]['title'])
print("\nRespuesta mas nueva: ",maximo(lista_date))
print( data['items'][lista_date.index(maximo(lista_date))]['title'])
# Obtener la respuesta del owner que tenga una mayor reputación--------------------------------
print("\nOwner con mayor reputacion: ",maximo(lista_reputation))
print( data['items'][lista_reputation.index(maximo(lista_reputation))]['owner']['display_name'])