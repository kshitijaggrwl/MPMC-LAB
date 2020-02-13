data segment
arr db 01h,00h,01h,00h
res db 00h,00h,00h,00h
data ends
code segment
assume cs:code, ds:data
start:
mov ax, data
mov ds, ax
mov ch, 03h
mov si, offset arr
mov di, offset res
mov ax, [si]
mov [di], ax
l1:
mov bx, [si]
inc si
mov dx, [si]
xor bx, dx
inc di
mov [di], bx
dec ch
jnz l1
int 3
code ends
end start

 
