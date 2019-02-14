;Realice un programa que ordene cuatro letras (may?sculas) en forma descendente 

.model small

.stack 100h

.data
;declaracion de variables
msg_1 db 'El contenido del array antes de organizar: ',13,10,'$'
msg_2 db 'El contenido del array despues de organizar: ',13,10,'$'
ARRAY db 78,70,83,90,'$'
;letras_minusculas db 61h,62h,63h,64h,65h,66h,67h,68h,69h,6Ah,6Bh,6Ch,6Dh,6Eh,6Fh,70h,71h,72h,73h,74h,75h,76h,77h,78h,79h,7Ah,"$"

.code
inicio:
.startup
    mov ax,@data
    mov dx,ax
    
    MOV BX, 4
    
    mov ah,9
    mov dx, offset msg_1
    int 21h
    
    mov ah,9
    mov dx, offset ARRAY
    int 21h
    
    outer_loop:
        mov cx, bx
        lea si, ARRAY
        
        inner_loop:
            mov al, [si]
            cmp al, [si+1]
            jl iguales
            xchg al, [si+1]
            mov [si], al
            
            iguales:
                inc si
                loop inner_loop
            
        dec cx
        jnz outer_loop
        
    mov ah,9
    mov dx, offset msg_2
    int 21h
    
    mov ah,9
    mov dx, offset ARRAY
    int 21h  
    
    mov ah,4ch                      ;DOS terminate program function
    int 21h                         ;terminate the program
     
end inicio