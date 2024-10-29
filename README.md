Universidad Del Quindío
Facultad de Ingeniería
Ingeniería De Sistemas Y Computación




Parcial  # 2
Fundamentos de Infraestrctura 


Integrantes: 

Derek Rodriguez Rodriguez 
Leidy Yuliana Rivera Quintero 



Profesor:Maycol Cardenas





Armenia Quindío, 2024


 Calculadora en Ensambrador 

En objectivo es crear una calculadora con las operaciones basicas como :
Suma, resta, multiplicacion, division.
Donde el usuario debe ingresar dos numeros y el tipo de operacion que se desea 
Realizar, tambien se maneja mesajes claro de error. 

Las herramientas que se utilizaron para realizar la calculadora son las siguientes
.Lenguaje: ensamblador:  32 bits 
.Entorno de desarrollo: asm
Sistema operativo: Linux

Implementacion:
Se dividio el codigo por secciones logicas para hacerlo mas entendible,se comenzo utilizando .
data : que sirve para almacenar los mensajes que el usuario va ingresando .
  .opcion: almacena la opcion seleccionada por el usuario.
  .msj1....: mensajes que se meustran al usuario.
  .len*:longitudes de mensajes

Bss: sirve para reservar espacio para las variables que almacena los resultados y los 
Numeros ingresados .
.numero1..:almacena los numeros y e resultado de las operaciones-
.cadena1..:son cadenas para la entrada y salida de datos 
.longitud1..:almacen elsigno del resultado en caso de ser negativo.

Text: contiene el codigo fuente.
.Entrada y salida : facilita la escritura y la salida en la consola.
.longitud:calcula la longitud de cada cadena 
.cadenaNumero: convierte una cadena a un numero entero.
.limpiarCadena:se limpia en contenido de una cadena.

Proceso Start
1.Inicializacion: se inicializan las variables a cero y se procede a limpiar las cadenas 
2.Interacion con el usuario: Procede a mostrar un mensaje pidiendo al usuario que ingrese la opcion deseada
3.Selecion de operacion :Dependiendo la opcion igresada por el usuario, se le procede a solicitar al usuario que ingrese dos numeros 
4.Operaciones aritmeticas:Se procede a convertir el resultado a una cadena para poder mostrarlo
5.Manejo de errores: donde si se intenta dividir por cero, se va a mostrar un 
Mensaje de error y se procede regresar al inicio 
6.Mostar resultados :convierte el resulatdo a una cadena e invierte  la cadena resultante  para poder asi mostrarla en la consola
6.Despues de que se procede a mostrar el resulatdo , el programa regresa al inicio 
Permitiendo asi elegir nuevas operaciones o si se desea seguir o finalizar.


