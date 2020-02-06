data segment
n dw 0ch
a dw 01h
b dw 00h
data ends
code segment
assume cs:code, ds:data
start:
mov ax, data
mov ds,ax
mov ax, a
mov bx, b
mov dx, n
fib:
mov cx,ax
add ax,bx
mov bx,cx
dec n
mov cx,dx
jnz fib
int 3
code ends
end start
