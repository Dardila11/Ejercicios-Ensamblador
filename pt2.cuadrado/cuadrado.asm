PANTALLA equ 0B800h

PILA SEGMENT STACK "STACK"
 db   40h dup(0)
PILA ENDS

CODE SEGMENT
 assume CS:code, SS:pila

START:
  mov  ax,PANTALLA
  mov  ds,ax

  mov  dl,10                    
  mov  cx,20                    

BucleLineas:
  push cx

  mov  dh,10                    
  mov  cx,40                    

BucleColumnas:
  mov  al,80*2                  
  mul  dl                       
  mov  bx,ax
  mov  al,2                     
  mul  dh                       
  add  bx,ax
  mov  word ptr [bx],704fh     
  inc  dh                       
  loop BucleColumnas
  pop  cx                       
  inc  dl                       
  loop BucleLineas
  mov  ax,4C00h
  int  21h

CODE ENDS
     END START