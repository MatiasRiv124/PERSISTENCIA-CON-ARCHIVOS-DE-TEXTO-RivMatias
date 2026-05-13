Proceso ProgramaNotas
	
    Definir listaCurso Como Cadena
    Dimension listaCurso[39]
	
    listaCurso[1] <- "Acosta Hanna"
    listaCurso[2] <- "Andrade Hugo"
    listaCurso[3] <- "Atiencia Josue"
    listaCurso[4] <- "Balarrezo Diego"
    listaCurso[5] <- "Barrionuevo Job"
    listaCurso[6] <- "Bedoya Juan"
    listaCurso[7] <- "Bravo Samuel"
    listaCurso[8] <- "Cajiao Paulo"
    listaCurso[9] <- "Calvopina Brandon"
    listaCurso[10] <- "Castelo Katherine"
    listaCurso[11] <- "Chacha Victor"
    listaCurso[12] <- "Chiluiza Steed"
    listaCurso[13] <- "Dominguez Daniel"
    listaCurso[14] <- "Freire Alan"
    listaCurso[15] <- "Gualle Abisag"
    listaCurso[16] <- "Guaman Alexander"
    listaCurso[17] <- "Guanga Sebastian"
    listaCurso[18] <- "Guanotoa Karla"
    listaCurso[19] <- "Landeta Edison"
    listaCurso[20] <- "Lara Karen"
    listaCurso[21] <- "Loor Jhon"
    listaCurso[22] <- "Lopez Washington"
    listaCurso[23] <- "Miranda Imanol"
    listaCurso[24] <- "Monar Jhair"
    listaCurso[25] <- "Muyulema Mateo"
    listaCurso[26] <- "Narvaez Antonella"
    listaCurso[27] <- "Nunez Bryan"
    listaCurso[28] <- "Pilco Mario"
    listaCurso[29] <- "Pomaquero Katherine"
    listaCurso[30] <- "Quevedo Gina"
    listaCurso[31] <- "Rivadeneyra Matias"
    listaCurso[32] <- "Rocha Carolina"
    listaCurso[33] <- "Sanchez Isaac"
    listaCurso[34] <- "Segovia Joseph"
    listaCurso[35] <- "Supe Joan"
    listaCurso[36] <- "Toapanta Matias"
    listaCurso[37] <- "Verdesoto Kevin"
    listaCurso[38] <- "Villacres Alejandro"
    listaCurso[39] <- "Viteri Shantal"
	
    Definir notas, promedios Como Real
    Definir tieneNotas Como Logico
	
    Dimension notas[39,5]
    Dimension promedios[39]
    Dimension tieneNotas[39]
	
    Definir totalEstudiantes, opcion, numeroLista, indice Como Entero
    Definir resultadoOperacion, num1, num2, suma Como Real
    Definir hayOperacion, hayNotas Como Logico
    Definir continuar Como Caracter
    Definir aprobados, reprobados Como Entero
	
    totalEstudiantes <- 39
    resultadoOperacion <- 0
    hayOperacion <- Falso
    hayNotas <- Falso
	
    Para i <- 1 Hasta totalEstudiantes Hacer
        tieneNotas[i] <- Falso
        promedios[i] <- 0
    FinPara
	
    Escribir "Bienvenido al programa de Matias Rivadeneyra"
	
    Repetir
		
        Escribir "=============================="
        Escribir "       MENU PRINCIPAL"
        Escribir "=============================="
        Escribir "1. Operaciones basicas"
        Escribir "2. Registro de notas"
        Escribir "3. Guardar resultados"
        Escribir "4. Salir"
        Escribir "Elige una opcion: "
        Leer opcion
		
        Segun opcion Hacer
			
            1:
                Escribir "--- OPERACIONES BASICAS ---"
                Escribir "1. Suma"
                Escribir "2. Resta"
                Escribir "3. Multiplicacion"
                Escribir "4. Division"
                Leer opcion
				
                Escribir "Ingresa el primer numero: "
                Leer num1
				
                Escribir "Ingresa el segundo numero: "
                Leer num2
				
                Si opcion = 1 Entonces
                    resultadoOperacion <- num1 + num2
                    Escribir "Resultado: ", resultadoOperacion
                    hayOperacion <- Verdadero
					
                Sino
                    Si opcion = 2 Entonces
                        resultadoOperacion <- num1 - num2
                        Escribir "Resultado: ", resultadoOperacion
                        hayOperacion <- Verdadero
						
                    Sino
                        Si opcion = 3 Entonces
                            resultadoOperacion <- num1 * num2
                            Escribir "Resultado: ", resultadoOperacion
                            hayOperacion <- Verdadero
							
                        Sino
                            Si opcion = 4 Entonces
                                Si num2 = 0 Entonces
                                    Escribir "Error: No se puede dividir para cero."
                                Sino
                                    resultadoOperacion <- num1 / num2
                                    Escribir "Resultado: ", resultadoOperacion
                                    hayOperacion <- Verdadero
                                FinSi
                            Sino
                                Escribir "Opcion no valida."
                            FinSi
                        FinSi
                    FinSi
                FinSi
				
            2:
				
                Repetir
					
                    Escribir "--- LISTA DEL CURSO ---"
					
                    Para i <- 1 Hasta totalEstudiantes Hacer
                        Escribir i, ". ", listaCurso[i]
						
                        Si tieneNotas[i] Entonces
                            Escribir " [YA REGISTRADO]"
                        FinSi
                    FinPara
					
                    Escribir "Ingresa el numero de lista del estudiante: "
                    Leer numeroLista
					
                    Si numeroLista < 1 O numeroLista > totalEstudiantes Entonces
                        Escribir "Numero de lista no valido."
                    Sino
						
                        indice <- numeroLista
						
                        Escribir "Ingresando notas para: ", listaCurso[indice]
						
                        suma <- 0
						
                        Para i <- 1 Hasta 5 Hacer
                            Escribir "Nota ", i, ": "
                            Leer notas[indice,i]
                            suma <- suma + notas[indice,i]
                        FinPara
						
                        promedios[indice] <- suma / 5
                        tieneNotas[indice] <- Verdadero
                        hayNotas <- Verdadero
						
                        Escribir "Promedio: ", promedios[indice]
						
                        Si promedios[indice] >= 7 Entonces
                            Escribir "Estado: APROBADO"
                        Sino
                            Escribir "Estado: REPROBADO"
                        FinSi
						
                    FinSi
					
                    Escribir "Deseas ingresar otro estudiante? (s/n): "
                    Leer continuar
					
                Hasta Que continuar <> "s" Y continuar <> "S"
				
            3:
				
                Escribir "--- GUARDAR RESULTADOS ---"
				
                Escribir "================================"
                Escribir "     RESULTADOS DEL PROGRAMA"
                Escribir "================================"
                Escribir "Estudiante: Matias Rivadeneyra"
                Escribir "Fecha: 2026"
                Escribir "Lenguaje: C++"
                Escribir "--------------------------------"
				
                Si hayOperacion Entonces
                    Escribir "OPERACION MATEMATICA:"
                    Escribir "Resultado = ", resultadoOperacion
                    Escribir "--------------------------------"
                FinSi
				
                aprobados <- 0
                reprobados <- 0
				
                Para i <- 1 Hasta totalEstudiantes Hacer
					
                    Escribir i, ". ", listaCurso[i]
					
                    Si tieneNotas[i] Entonces
						
                        Escribir "Notas: "
						
                        Para j <- 1 Hasta 5 Hacer
                            Escribir notas[i,j]
                        FinPara
						
                        Escribir "Promedio: ", promedios[i]
						
                        Si promedios[i] >= 7 Entonces
                            Escribir "APROBADO"
                            aprobados <- aprobados + 1
                        Sino
                            Escribir "REPROBADO"
                            reprobados <- reprobados + 1
                        FinSi
						
                    Sino
                        Escribir "Sin notas registradas"
                    FinSi
					
                FinPara
				
                Escribir "--------------------------------"
                Escribir "Total aprobados: ", aprobados
                Escribir "Total reprobados: ", reprobados
				
            4:
                Escribir "Saliendo del programa..."
				
            De Otro Modo:
                Escribir "Opcion no valida."
				
        FinSegun
		
    Hasta Que opcion = 4
	
FinProceso