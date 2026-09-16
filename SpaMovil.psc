SubProceso tamano_gato (lista_tamano Por Referencia, contador Por Referencia)
	Definir tamano Como Cadena
	Definir valido Como Logico
	valido <- Falso
	
	Mientras NO valido Hacer
		Escribir "¿Cuál es el tamaño de la mascota? (Pequeño/Mediano):"
		Leer tamano
		
		Si tamano = "Pequeño" O tamano = "pequeño" O tamano = "Mediano" O tamano = "mediano" Entonces
			lista_tamano[contador] <- tamano
			valido <- Verdadero
		Sino
			Escribir "Opción no válida."
		FinSi
	FinMientras
FinSubProceso

SubProceso tamano_perro (lista_tamano Por Referencia, lista_precios Por Referencia, contador Por Referencia, b_perro_1, b_perro_2)
	Definir tamano Como Cadena
	Definir valido Como Logico
	valido <- Falso
	
	Mientras NO valido Hacer
		Escribir "¿Cuál es el tamaño de la mascota? (Pequeño/Mediano/Grande/Gigante):"
		Leer tamano
		
		Si tamano = "Pequeño" O tamano = "pequeño" O tamano = "Mediano" O tamano = "mediano" Entonces
			lista_tamano[contador] <- tamano
			lista_precios[contador] <- b_perro_1
			valido <- Verdadero
		Sino
			Si tamano = "Grande" O tamano = "grande" O tamano = "Gigante" O tamano = "gigante" Entonces
				lista_tamano[contador] <- tamano
				lista_precios[contador] <- b_perro_2
				valido <- Verdadero
			Sino
				Escribir "Opción no válida."
			FinSi
		FinSi
	FinMientras
FinSubProceso

SubProceso servicio_adicional (lista_adicionales Por Referencia, contador Por Referencia)
	Definir opcion_adicional Como Entero
	Definir valido Como Logico
	valido <- Falso
	
	Mientras NO valido Hacer
		Escribir "¿Qué servicios adicionales le gustaria agregar al baño de su mascota?"
		Escribir "1. Corte de uñas | 10.000 COP"
		Escribir "2. Limpieza de oídos | 5.000 COP"
		Escribir "3. Ambas | 15.000 COP"
		Escribir "4. Ningún servicio adicional"
		Escribir "Escribe el número que esta al lado del servicio adicional que deseas:"
		Leer opcion_adicional
		
		Segun opcion_adicional Hacer
			1:
				lista_adicionales[contador] <- 10000.0
				valido <- Verdadero
			2:
				lista_adicionales[contador] <- 5000.0
				valido <- Verdadero
			3:
				lista_adicionales[contador] <- 15000.0
				valido <- Verdadero
			4:
				lista_adicionales[contador] <- 0.0
				valido <- Verdadero
			De Otro Modo:
				Escribir "Opción no válida."
				Escribir "-------------------------------------------------------------------------------------"
		FinSegun
	FinMientras
FinSubProceso

Funcion total_dia_val <- calcular_total_dia(lista_precios Por Referencia, lista_adicionales Por Referencia, limite)
	Definir total_dia_val, suma Como Real
	Definir i Como Entero
	suma <- 0.0
	
	Para i <- 1 Hasta limite Con Paso 1 Hacer
		suma <- suma + lista_precios[i] + lista_adicionales[i]
	FinPara
	
	total_dia_val <- suma
FinFuncion

SubProceso mostrar_datos(lista_nombre Por Referencia, lista_mascotas Por Referencia, lista_tamano Por Referencia, lista_adicionales Por Referencia, lista_precios Por Referencia, limite)
	Definir i Como Entero
	Definir Total_pagado Como Real
	
	Para i <- 1 Hasta limite Con Paso 1 Hacer
		Total_pagado <- lista_precios[i] + lista_adicionales[i]
		Escribir "-------------------------------------------------------------------------------------"
		Escribir "DATOS DEL CLIENTE #", i, ":"
		Escribir "Nombre de la mascota:  ", lista_nombre[i]
		Escribir "Tipo de la mascota:    ", lista_mascotas[i]
		Escribir "Tamaño de la mascota:  ", lista_tamano[i]
		Escribir "Servicios adicionales: ", lista_adicionales[i]
		Escribir "Precio:                ", lista_precios[i]
		Escribir "Total pagado:          ", Total_pagado
	FinPara
FinSubProceso

Algoritmo SpaMovil
	Definir b_gato, b_perro_1, b_perro_2, total Como Real
	b_gato <- 30000.0
	b_perro_1 <- 25000.0
	b_perro_2 <- 45000.0
	total <- 0.0
	
	Dimension lista_mascotas[100]
	Dimension lista_nombre[100]
	Dimension lista_tamano[100]
	Dimension lista_adicionales[100]
	Dimension lista_precios[100]
	
	Definir cantidad_mascotas, contador, opcion_mascota, total_atendidos Como Entero
	Definir nombre, opcion_datos Como Cadena
	
	Escribir "-------------------------------------------------------------------------------------"
	Escribir "                 ¡BIENVENIDO AL SISTEMA DE FACTURACIÓN DEL SPA MOVIL!                "
	Escribir "-------------------------------------------------------------------------------------"
	
	Escribir "Ingrese la cantidad de mascotas por atender hoy:"
	Leer cantidad_mascotas
	Escribir "-------------------------------------------------------------------------------------"
	
	total_atendidos <- cantidad_mascotas
	contador <- 1
	
	Si cantidad_mascotas <> 0 Entonces
		Mientras cantidad_mascotas > 0 Hacer
			Escribir "Escribe el nombre de la mascota:"
			Leer nombre
			
			Escribir "-------------------------------------------------------------------------------------"
			Escribir "¿Qué tipo de mascota vas a bañar?"
			Escribir "1. Gato | 30.000 COP"
			Escribir "2. Perro | 25.000 a 45.000 COP"
			Escribir "Escribe el número que esta al lado del tipo de mascota que vas a bañar:"
			Leer opcion_mascota
			Escribir "-------------------------------------------------------------------------------------"
			
			Segun opcion_mascota Hacer
				1:
					lista_nombre[contador] <- nombre
					lista_mascotas[contador] <- "Gato"
					
					tamano_gato(lista_tamano, contador)
					Escribir "-------------------------------------------------------------------------------------"
					
					servicio_adicional(lista_adicionales, contador)
					lista_precios[contador] <- b_gato
					Escribir "-------------------------------------------------------------------------------------"
					
					contador <- contador + 1
					cantidad_mascotas <- cantidad_mascotas - 1
					
				2:
					lista_nombre[contador] <- nombre
					lista_mascotas[contador] <- "Perro"
					
					tamano_perro(lista_tamano, lista_precios, contador, b_perro_1, b_perro_2)
					Escribir "-------------------------------------------------------------------------------------"
					
					servicio_adicional(lista_adicionales, contador)
					Escribir "-------------------------------------------------------------------------------------"
					
					contador <- contador + 1
					cantidad_mascotas <- cantidad_mascotas - 1
					
				De Otro Modo:
					Escribir "Opción no válida."
			FinSegun
		FinMientras
		
		total <- calcular_total_dia(lista_precios, lista_adicionales, total_atendidos)
		
		Escribir "                         EL TOTAL DEL DÍA ES: ", total, " COP                           "
		Escribir "-------------------------------------------------------------------------------------"
		
		Escribir "¿Deseas mostrar los datos de todas las mascotas atendidas hoy? (Si/No):"
		Leer opcion_datos
		
		Si opcion_datos = "Si" O opcion_datos = "si" O opcion_datos = "SI" Entonces
			mostrar_datos(lista_nombre, lista_mascotas, lista_tamano, lista_adicionales, lista_precios, total_atendidos)
		FinSi
		
		Escribir "-------------------------------------------------------------------------------------"
		Escribir "                                 ESO ES TODO POR HOY                                 "
		Escribir "                                 ¡TEN UN FELIZ DÍA!                                  "
		Escribir "-------------------------------------------------------------------------------------"
		
	SiNo
		Escribir "                            No hay mascotas por atender hoy                           "
		Escribir "-------------------------------------------------------------------------------------"
		Escribir "                                 ¡TEN UN FELIZ DÍA!                                  "
		Escribir "-------------------------------------------------------------------------------------"
	FinSi
FinAlgoritmo