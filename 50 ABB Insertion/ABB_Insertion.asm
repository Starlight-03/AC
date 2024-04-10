%include "io.inc"

section .data
    n dw 5
    T dw 5, 3, 8, 1, 4
    x dw 2
    s db " "

section .text
global main

main:
    mov ebp, esp; for correct debugging
    mov eax, 0
    mov ebx, 0
    mov ecx, 2
    mov edx, 0

loop1:
    mov eax, ebx
    mov edx, [T + eax * 2]
    cmp dl, [x]
    je print
    jmp lower_or_greater

lower_or_greater:
    jg lower
    jmp greater

lower:
    imul ebx, 2
    inc ebx
    cmp bl, [n]
    jl loop1
    jmp lower_biggest

greater:
    imul ebx, 2
    add ebx, 2
    cmp bl, [n]
    jl loop1
    jmp lower_biggest

lower_biggest:
    cmp dl, [x]
    jg print
    inc eax
    xor edx, edx
    div ecx
    dec eax
    mov edx, [T + eax * 2]
    loop lower_biggest    

print:
    PRINT_DEC 2, eax
    ret
