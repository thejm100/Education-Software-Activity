#Variables globales
b_gato = 30000.0                                                     
b_perro_1 = 25000.0                                                  #Precio base para perros pequeños y medianos
b_perro_2 = 45000.0                                                  #Precio base para perros grandes y gigantes
total = 0.0

#Variable globales de listas
lista_mascotas = []
lista_nombre = []
lista_tamaño = []
lista_adicionales = []
lista_precios = []
lista_total = []


#Bienvenida y cantidad de mascotas que se van a atender.
print("-------------------------------------------------------------------------------------")
print("                 ¡BIENVENIDO AL SISTEMA DE FACTURACIÓN DEL SPA MOVIL!                ")
print("-------------------------------------------------------------------------------------")

cantidad_mascotas = int(input("Ingrese la cantidad de mascotas por atender hoy: "))
print("-------------------------------------------------------------------------------------")

#Función para saber el tamaño del gato
def tamaño_gato():
    while True:                                        #El uso es practico; sino me tocaría poner una condición muy larga
        tamaño = str(input("¿Cuál es el tamaño de la mascota? (Pequeño/Mediano): "))
        tamaño = tamaño.capitalize()

        match tamaño:                                  #Casos para el tamaño del gato
            case "Pequeño" | "Mediano":         
                lista_tamaño.append(tamaño)
                break
            case _:
                print("Opción no válida.")
                continue

    return lista_tamaño

#Función para saber el tamaño del perro
def tamaño_perro():
    while True:                                        #El uso es practico; sino me tocaría poner una condición muy larga
        tamaño = str(input("¿Cuál es el tamaño de la mascota? (Pequeño/Mediano/Grande/Gigante): "))
        tamaño = tamaño.capitalize()
        
        match tamaño:                                  #Casos para el tamaño del perro
            case "Pequeño" | "Mediano":                #Se utiliza el operador | para agrupar casos
                lista_tamaño.append(tamaño)
                lista_precios.append(b_perro_1)        #Precio del servicio
                break
            case "Grande" | "Gigante":
                lista_tamaño.append(tamaño)
                lista_precios.append(b_perro_2)        #Precio del servicio
                break
            case _:
                print("Opción no válida.")
                continue

    return lista_precios, lista_tamaño

#Función para saber el servicio adicional
def servicio_adicional():
    while True:
        print("¿Qué servicios adicionales le gustaria agregar al baño de su mascota?")
        print("1. Corte de uñas | 10.000 COP")
        print("2. Limpieza de oídos | 5.000 COP")
        print("3. Ambas | 15.000 COP")
        print("4. Ningún servicio adicional")
        opcion_adicional = int(input("Escribe el número que esta al lado del servicio adicional que deseas: "))
    
        match opcion_adicional:
            case 1:
                lista_adicionales.append(10000.0)
                break
            case 2:
                lista_adicionales.append(5000.0)
                break
            case 3:
                lista_adicionales.append(15000.0)
                break
            case 4:
                lista_adicionales.append(0.0)
                break
            case _:
                print("Opción no válida.")
                print("-------------------------------------------------------------------------------------")
                continue

    return lista_adicionales

#Función para calcular el total del día
def total_día():
    global total
    
    for i in range (len(lista_precios)):                #Ciclo que suma el precio por bañar a cada mascota
        total = total + lista_precios[i]            

    for i in range (len(lista_adicionales)):            #Ciclo que suma el precio de los servicios adicionales
        total = total + lista_adicionales[i]

    return total

#Función para mostrar los datos de todas las mascotas
def mostrar_datos():
    for i in range(len(lista_nombre)):
        Total_pagado = lista_precios[i] + lista_adicionales[i]
        

        print("-------------------------------------------------------------------------------------")
        print(f"DATOS DEL CLIENTE #{i}: ")
        print(f"Nombre de la mascota:  {lista_nombre[i]}")
        print(f"Tipo de la mascota:    {lista_mascotas[i]}")
        print(f"Tamaño de la mascota:  {lista_tamaño[i]}")
        print(f"Servicios adicionales: {lista_adicionales[i]}")
        print(f"Precio:                {lista_precios[i]}")
        print(f"Total pagado:          {Total_pagado}")

#Cuerpo del codigo
if cantidad_mascotas != 0:

    while cantidad_mascotas > 0:

        nombre = str(input("Escribe el nombre de la mascota: "))
        nombre = nombre.capitalize()

        print("-------------------------------------------------------------------------------------")
        print("¿Qué tipo de mascota vas a bañar?")
        print("1. Gato | 30.000 COP")
        print("2. Perro | 25.000 a 45.000 COP")

        opcion_mascota = int(input("Escribe el número que esta al lado del tipo de mascota que vas a bañar: "))
        print("-------------------------------------------------------------------------------------")
    
        #Desición de que tipo de mascota es
        match opcion_mascota:
            case 1:
                lista_nombre.append(nombre)                                   #Nombre de la mascota
                lista_mascotas.append("Gato")                                 #Tipo de mascota

                tamaño_gato()                                                 #Tamaño de la mascota
                print("-------------------------------------------------------------------------------------")

                servicio_adicional()                                          #Servicio adicional

                lista_precios.append(b_gato)                                  #Precio del servicio
                print("-------------------------------------------------------------------------------------")

                cantidad_mascotas = cantidad_mascotas - 1

            case 2:
                lista_nombre.append(nombre)                                   #Nombre de la mascota
                lista_mascotas.append("Perro")                                #Tipo de mascota

                tamaño_perro()                                                #Tamaño de la mascota
                print("-------------------------------------------------------------------------------------")

                servicio_adicional()                                          #Servicio adicional
                print("-------------------------------------------------------------------------------------")

                cantidad_mascotas = cantidad_mascotas - 1
                
            case _:
                print("Opción no válida.")   

    total_día()                                                                #Cálculo del total del día

    print(f"                         EL TOTAL DEL DÍA ES: {total} COP                           ")
    print("-------------------------------------------------------------------------------------")

    opcion_datos = str(input("¿Deseas mostrar los datos de todas las mascotas atendidas hoy? (Si/No): "))
    opcion_datos = opcion_datos.lower()

    if opcion_datos == "si":                                                   #Datos de todas las mascotas atendidas
        mostrar_datos()

    print("-------------------------------------------------------------------------------------")
    print("                                 ESO ES TODO POR HOY                                 ")
    print("                                 ¡TEN UN FELIZ DÍA!                                  ")
    print("-------------------------------------------------------------------------------------")

else:
    print("                           No hay mascotas por atender hoy                           ")
    print("-------------------------------------------------------------------------------------")
    print("                                 ¡TEN UN FELIZ DÍA!                                  ")
    print("-------------------------------------------------------------------------------------")