section .data
    array db 10, 5, 16, 2, 8, 13, 20, 0, 3, 6, 9, 12, 14, 17, 21
    array_len equ $ - array

section .text
    global main

main:
    mov eax, 11
    mov edi, 0
    mov ebx, [array + edi]
    call check_loop

    mov esi, array  ; Puntero al comienzo del array
    mov ecx, array_len  ; Longitud del array

;print_loop:
;    movzx eax, byte [esi]  ; Carga el valor del array en eax
;    call print_number  ; Llama a la función para imprimir el número
;    inc esi  ; Avanza al siguiente elemento del array
;    loop print_loop  ; Repite hasta que todos los elementos hayan sido impresos

    ; Salir del programa
;    mov eax, 1  ; Código de salida
;    xor ebx, ebx  ; Limpiar ebx
;    int 0x80

check_loop:
    cmp eax, ebx
    je print
    cmp eax, ebx
    jl lower
    cmp eax, ebx
    jg greater
    mul edi, 2
    add edi, 2  ; Saltar al siguiente nodo (avanza 2 bytes)
    mov ebx, [array + edi]  ; Obtener el siguiente valor del array
    loop check_loop  ; Repetir hasta que se encuentre un valor mayor
    jmp insert_right  ; Insertar nuevo valor como hijo derecho

lower:
    mul edi, 2
    add edi, 1
    mov ebx, [array + edi]  ; Obtener el siguiente valor del array
    loop check_loop  ; Repetir hasta que se encuentre un valor menor
    jmp insert_left  ; Insertar nuevo valor como hijo izquierdo

greater:
    mul edi, 2
    add edi, 2  ; Saltar al siguiente nodo (avanza 2 bytes)
    mov ebx, [array + edi]  ; Obtener el siguiente valor del array
    loop check_loop  ; Repetir hasta que se encuentre un valor menor
    jmp insert_left  ; Insertar nuevo valor como hijo izquierdo

print:
    ; Función para imprimir un número en la consola
    push eax  ; Guarda el valor de eax
    mov eax, 4  ; syscall de escritura
    mov ebx, 1  ; descriptor de archivo (stdout)
    mov ecx, esp  ; puntero al número a imprimir
    mov edx, 1  ; longitud del número (en bytes)
    int 0x80  ; llama al kernel
    pop eax  ; Restaura el valor de eax
    ret
