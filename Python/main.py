from funciones import *

data = conectar()#conexion al enlace
llenar_listas(data)

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