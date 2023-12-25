.model small
.stack 100h

.data                            
str db 10,13 ,"Enter any Value =$"
str1 db 10,13 ,"Bubble sort =$"
array db 10 du(0)
.code

mov ax,@data
mov ds,ax

lea dx,str
mov ah,9
int 21h

mov cx,10
mov bx,offset array

input:
mov ah,1
int 21h
mov [bx],al
inc bx
loop input

mov cx,10
dec cx

nextscan:
mov bx,cx
mov si,0

nextcmp:
mov al,array[si]
mov dl,array[si+1]
cmp al,dl
jb noswap

mov array[si],dl
mov array[si+1],al

noswap:
inc si
dec bx
jnz nextcmp
loop nextscan

lea dx,str1
mov ah,9
int 21h

mov cx,10
mov bx,offset array

print:
mov dl,[bx]
mov ah,2
int 21h

inc bx
loop print
       
exit:
mov ah,4ch
int 21h
