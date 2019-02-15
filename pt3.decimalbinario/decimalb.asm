;Realice un programa que convierta un numero decimal (0 a 255) a binario

.model small

.stack 100h

.data

msg_1 db "Numero a convertir: " ,10,13, "$"
msg_2 db "BINARIO: " ,10,13, "$"

str1 DB 20 DUP('$')
str2 DB 20 DUP('$')
numero dw 10

.code
START:
   mov ax, @data
   mov ds, ax
    
     
   mov si, offset str1   
   mov ax,numero                ;guardamos el valor de numero en el registro ax
   mov bh,00
   mov bl,2                     ;necesitamos guardar 2 para realizar la division
   
   loop_1:
    div bl
    add ah,'0'
    mov byte ptr[si],ah         ;guardamos en el indice SI el valor de ah
    mov ah,00                   ;reseteamos ah en 00
    inc si                      ;pasamos al siguiente posicion de si
    inc bh
    cmp al,00
    jne loop_1                  ;JUMP si la condicion es verdadera
    
    mov cl,bh
    lea si,str1                 ;se carga la direcion pero no el contenido
    lea di,str2
    mov ch,00
    add si,cx
    dec si
    
   loop_2:
    mov ah,byte ptr[si]
    mov byte ptr[di],ah
    dec si
    inc di
    loop loop_2
    
    
    
    mov ah,9
    mov dx, offset msg_2
    int 21h
    
    mov ah,9
    mov dx, offset str2
    int 21h
    
    
    mov ah,4ch
    int 21h
    
    end START