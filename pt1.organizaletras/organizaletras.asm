.model small

.stack

.data
;declaracion de variables
msg_1 db 'El contenido del array antes de organizar: ',13,10,'$'
ARRAY db 46h,41h,55h,4C,
letras db 41h,42h,43h,44h,45h,46h,47h,48h,49h,4A,4B,4C,4D,4E,4F,50h,51h,52h,53h,54h,55h,56h,57h,58h,59h,5A

.code
inicio:
.startup
    mov ax,@data
    mov dx,ax
    
    lea dx,msg_1
    mov ah,9
    int 21h
    
    mov ah,4ch ;DOS terminate program function
    int 21h ;terminate the program
    
end inicio