assume cs:code, ds:data
data segment
mat1  db  -01h,-02h,-03h,-04h,-05h,-06h
mat2  db  01h,01h,01h,01h,01h,01h
mat3  dw  06h  dup(?)
data ends
code segment
start:
mov ax, data
mov ds, ax
mov bx, offset mat1
mov si, offset mat2
mov di, offset mat3
mov cl, 05h
s1:
mov ax, [bx]
mov dx, [si]
add ax, dx
mov [di], ax
inc si
inc di
inc bx
sub cl, 01h
jnz s1
int 3
code ends
end start
