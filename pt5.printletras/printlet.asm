;Realizar un programa que imprima en consola todas las letras min?sculas del alfabeto de forma
;descendente junto con su ?ndice y con saltos de l?nea.

;TODO 1: Falta agregar el indice antes de cada letra
;TODO 2: Arreglar la ventana del muestra cuando hay muchas letras. Ventana muy peque?a

.model small

.stack

.data

msg_1 db "letras minusculas de forma descendente" ,10,13, "$"
msg_2 db "1. ",10,13,"$"
.code
START:
   mov ax, @data
   mov ds, ax
   
   mov ah,9
   mov dx, offset msg_1
   int 21h
   
   mov cx,8        ;inicializamos cx en 26
   mov ah,2
   mov dl,104      ;seteamos a dl con 122 el cual es z
   
   
   mov al, 8
     
   @LOOP:
   
    ;necesitamos mostrar el indice 
    ;convertirmos el numero a String
    ;https://bit.ly/2UZtn6A
    mov bl,dl
    mov ah, 02h
    mov dl, al
    add dl, "0"
    int 21h

    mov dl,bl
    
    dec al
   
    
   
    int 21h         ;mostramos el caracter
    dec dl          ;incrementamos DL con el siguiente caracter ASCII
    dec cx          ;decrementamos cx
    
    mov bl,dl       ;guardamos el valor de dl antes de sobreescribirlo con el salto de linea
   
    mov dl, 10      ;salto de linea
    mov ah, 02h
    int 21h
    mov dl, 13
    int 21h
    
    mov dl,bl     ;retornamos su valor

   JNZ @LOOP        ;saltamos a LOOP si cx es igual a 0
        
   mov ah, 4ch
   int 21h
end START
