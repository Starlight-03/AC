%include "io.inc"

section .data
    n dw 2
    T dw 2, 1, 3
    c_T dw 3
    espacio db " ", 0

section .text
global main

main:
    mov ebp, esp ; para depuración correcta
    
    mov esi, T  ; Carga la dirección base del arreglo T en esi
    mov eax, 0  ; Inicializa el registro eax a 0
    mov ebx, 0  ; Inicializa el registro ebx a 0
    
    cmp ebx, [c_T]  ; Compara el contador ebx con el tamaño del arreglo
    je Fin  ; Si son iguales, salta a Fin
    
    jmp Ciclo1  ; Si no, comienza el ciclo de búsqueda

Ciclo1:
    mov eax, ebx  ; Mueve el índice actual a eax
    mov edx, [esi + eax*2]  ; Obtiene el valor del arreglo en la posición actual
    
    cmp edx, [n]  ; Compara el valor del arreglo con el valor buscado
    je Encontrado  ; Si son iguales, salta a Encontrado
    jmp MenorOMayor  ; Si no, compara si el valor del arreglo es menor o mayor que el valor buscado

MenorOMayor:
    cmp edx, [n]  ; Compara nuevamente el valor del arreglo con el valor buscado
    jl Menor  ; Si es menor, salta a Menor
    jmp Mayor  ; Si no, salta a Mayor

Menor:
    imul eax, 2  ; Duplica el índice actual (ebx)
    add eax, 1   ; Le suma 1 al índice actual duplicado
    mov ebx, eax  ; Actualiza el índice actual (ebx) con el valor duplicado + 1
    jmp Ciclo1  ; Salta de nuevo al ciclo de búsqueda

Mayor:
    imul eax, 2  ; Duplica el índice actual (ebx)
    add eax, 2   ; Le suma 2 al índice actual duplicado
    mov ebx, eax  ; Actualiza el índice actual (ebx) con el valor duplicado + 2
    jmp Ciclo1  ; Salta de nuevo al ciclo de búsqueda

Encontrado:
    PRINT_STRING espacio  ; Imprime un espacio para separar los números
    PRINT_DEC 2, edx  ; Imprime el valor encontrado
    jmp Fin  ; Salta a la etiqueta Fin

Fin:
    ret  ; Retorna de la función
