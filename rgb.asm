;Dado un color en RGB en memoria, imprimir el nombre  del color en consola 
;(solo para rojo, amarillo, naranja, azul, violeta y verde)

.model small

.stack 100h

.data

rojo db "rojo",10,13, "$"
verde db "verde",10,13, "$"
azul db "azul",10,13, "$"
amarillo db "amarillo",10,13, "$"
naranja db "naranja",10,13, "$"
violeta db "violeta",10,13, "$"

no_existe db "No se encuentra el color",10,13,"$"

r dw 127
g dw 0
b dw 255
.code
START:
mov ax,@data
mov ds,ax

mov ax, r
mov bx, g
mov cx, b

cmp ax,255
je color_r_a
cmp ax,0
je color_v_az
cmp ax,239
je color_n
cmp ax,127
jmp color_vio


color_r_a:
cmp bx,0
je color_r
cmp bx,255
je color_ama
jne no_exis

color_r:
cmp cx,0
je color_rojo
jne no_exis

color_ama:
cmp cx,0
je color_amarillo
jne no_exis

color_v_az:
cmp bx,255
je color_v
jne color_az

color_v:
cmp cx,0
je color_verde
jne no_exis

color_az:
cmp cx,255
je color_azul
jne no_exis

color_n:
cmp bx,127
je color_na

color_na:
cmp cx,26
je color_naranja
jne no_exis

color_vio:
cmp bx,0
je color_viole
jne no_exis

color_viole:
cmp cx,255
je color_violeta
jne no_exis

no_exis:
mov ah,9
mov dx, offset no_existe
int 21h

mov ah,4ch
int 21h

color_rojo:
mov ah,9
mov dx, offset rojo
int 21h

mov ah,4ch
int 21h

color_verde:
mov ah,9
mov dx, offset verde
int 21h

mov ah,4ch
int 21h

color_azul:
mov ah,9
mov dx, offset azul
int 21h

mov ah,4ch
int 21h

color_amarillo:
mov ah,9
mov dx, offset amarillo
int 21h

mov ah,4ch
int 21h

color_naranja:
mov ah,9
mov dx, offset naranja
int 21h

mov ah,4ch
int 21h

color_violeta:
mov ah,9
mov dx, offset violeta
int 21h

mov ah,4ch
int 21h
    

end START