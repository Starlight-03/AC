%include "io.inc"

section .data
a dd 8              ; Define la variable 'a' con valor 8
b dd 3               ; Define la variable 'b' con valor 3
c dd 1               ; Define la variable 'c' con valor 1
d dd 4               ; Define la variable 'd' con valor 4

section .text
global CMAIN         ; Define la función global CMAIN

CMAIN:               ; Punto de entrada del programa
    mov ebp, esp     ; Establece el puntero de pila base (EBP) para depuración

    xor edx, edx     ; Limpia el registro EDX (usado para divisiones)

    mov eax, [a]     ; Carga el valor de 'a' en EAX
    mov ebx, [c]     ; Carga el valor de 'c' en EBX
    
    ;Multiplicar numerador
    imul ebx         ; Multiplica EAX por EBX y guarda el resultado en EDX:EAX
    push eax         ; Guarda el resultado (numerador) en la pila
    xor edx, edx     ; Limpia el registro EDX

    mov eax, [d]     ; Carga el valor de 'd' en EAX
    mov ebx, [b]     ; Carga el valor de 'b' en EBX
    
    ;Multiplicar denominador
    imul ebx         ; Multiplica EAX por EBX y guarda el resultado en EDX:EAX
    push eax         ; Guarda el resultado (denominador) en la pila
    xor edx, edx     ; Limpia el registro EDX

    mov eax, [esp]       ; Carga el valor del numerador desde la pila a EAX
    mov ebx, [esp + 4]   ; Carga el valor del denominador desde la pila a EBX
    
    cmp eax, ebx          ; Compara el numerador con el denominador
    jge mcd               ; Salta a 'mcd' si el numerador es mayor o igual al denominador

    xchg eax,ebx          ; Intercambia los valores de EAX y EBX si el denominador es mayor que el numerador
    
    ;Calculo del MCD
    mcd:
        cmp ebx, 0            ; Compara el denominador con 0
        je end                ; Salta a 'end' si el denominador es 0
        xor edx, edx          ; Limpia el registro EDX
        div ebx               ; Divide EAX por EBX, guarda el cociente en EAX y el residuo en EDX
        mov eax, ebx          ; Mueve el valor de EBX (denominador) a EAX
        mov ebx, edx          ; Mueve el residuo (nuevo denominador) a EBX
        jmp mcd               ; Salta a 'mcd' para repetir el bucle

    end:
        mov ecx,eax            ; Mueve el valor de EAX (MCD) a ECX
        pop eax                ; Saca el valor del numerador de la pila a EAX
        idiv ecx               ; Divide EAX por ECX, guarda el cociente en EAX
        mov ebx,eax            ; Mueve el cociente (numerador) a EBX
        pop eax                ; Saca el valor del denominador de la pila a EAX
        div ecx                ; Divide EAX por ECX, guarda el cociente en EAX (nuevo denominador)

PRINT_DEC 4, eax             ; Imprime el numerador
PRINT_STRING "/"             ; Imprime el símbolo de división
PRINT_DEC 4, ebx             ; Imprime el denominador

    ret                       ; Retorno de la función