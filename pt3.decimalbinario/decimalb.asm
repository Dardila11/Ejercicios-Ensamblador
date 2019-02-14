;Realice un programa que convierta un numero decimal (0 a 255) a binario

.model small

.stack 100h

.data

msg_1 db "Numero a convertir: " ,10,13, "$"
msg_2 db "BINARIO: " ,10,13, "$"

str1 DB 20 DUP('$')
str2 DB 20 DUP('$')
numero DW 255

.code
START:
   mov ax, @data
   mov ds, ax
    
   lea si,str1                  ;inicializamos el array vacio de 20
   mov ax,numero                ;guardamos el valor de numero en el registro ax
   mov bh,00
   mov bl,2                     ;necesitamos guardar 2 para realizar la division
   
   loop_1:
    div bl
    add ah,'0'
    mov byte ptr[si],ah
    mov ah,00
    inc si
    inc bh
    cmp al,00
    jne loop_1
    
    mov cl,bh
    lea si,str1
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