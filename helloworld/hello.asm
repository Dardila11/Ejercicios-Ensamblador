.model small

.stack

.data
;declaracion de variables
msg DB 'Hello, world',13,10,'$'
.code
.startup
    mov ax,@data
    mov ds,ax ;set DS to point to the data segment
    
    mov ah,09h  ;DOS print string function
    mov dx, offset msg ;point to hello, world
    int 21h ;display hello world
    
    mov ah,4ch ;DOS terminate program function
    int 21h ;terminate the program
    
end
