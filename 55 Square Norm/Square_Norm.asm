%include "io.inc"
section .data
    n dd 3
    v dw 1, 2,3
    indice dw 0
    espacio db " ", 0

section .text
global main
main:
    mov ebp, esp ; for correct debugging

    mov cx, [indice]
    mov dx, 0 ; Inicializamos dx (acumulador) en 0 antes de comenzar

ciclo:
    mov esi, v
    cmp cx, [n]
    je fin
    movzx eax, cx
    imul eax, eax, 2
    add esi, eax
    mov ax, [esi]
    imul ax, ax ; Calculamos el cuadrado del elemento actual
    add dx, ax ; Sumamos el cuadrado al acumulador
    inc cx
    jmp ciclo

fin:
    PRINT_DEC 2, dx ; Imprimimos el resultado acumulado
    PRINT_STRING espacio
    ret
