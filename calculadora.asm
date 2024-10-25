section .data
    msg1 db "Ingrese el primer numero: ", 0
    len1 equ $ - msg1
    msg2 db "Ingrese el segundo numero: ", 0
    len2 equ $ - msg2
    menu_msg db "Seleccione una operacion:", 0xA, "1. Sumar", 0xA, "2. Restar", 0xA, "3. Multiplicar", 0xA, "4. Dividir", 0xA, 0
    menu_len equ $ - menu_msg
    result_msg db "Resultado: ", 0
    result_len equ $ - result_msg

    buffer1 db 0
    buffer2 db 0
    option db 0

section .bss
    num1 resb 4
    num2 resb 4

section .text
    global _start

_start:
    ; Solicitar primer numero
    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; Leer primer numero
    mov eax, 3              ; sys_read
    mov ebx, 0              ; stdin
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; Solicitar segundo numero
    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; Leer segundo numero
    mov eax, 3              ; sys_read
    mov ebx, 0              ; stdin
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; Mostrar el menu
    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, menu_msg
    mov edx, menu_len
    int 0x80

    ; Leer la opcion seleccionada
    mov eax, 3              ; sys_read
    mov ebx, 0              ; stdin
    mov ecx, option
    mov edx, 1
    int 0x80

    ; Convertir los números de ASCII a enteros
    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'

    ; Realizar la operación seleccionada
    cmp byte [option], '1'   ; Sumar
    je sumar
    cmp byte [option], '2'   ; Restar
    je restar
    cmp byte [option], '3'   ; Multiplicar
    je multiplicar
    cmp byte [option], '4'   ; Dividir
    je dividir

sumar:
    add eax, ebx
    jmp mostrar_resultado

restar:
    sub eax, ebx
    jmp mostrar_resultado

multiplicar:
    imul ebx
    jmp mostrar_resultado

dividir:
    xor edx, edx    ; Limpiar el registro edx
    div ebx         ; Dividir eax entre ebx
    jmp mostrar_resultado

mostrar_resultado:
    ; Preparar el mensaje de resultado
    add eax, '0'            ; Convertir el resultado a ASCII

    mov [buffer1], eax
    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, result_msg
    mov edx, result_len
    int 0x80

    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, buffer1
    mov edx, 1
    int 0x80

    ; Salir del programa
    mov eax, 1              ; sys_exit
    xor ebx, ebx
    int 0x80
