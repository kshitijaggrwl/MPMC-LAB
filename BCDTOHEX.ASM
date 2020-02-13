data segment
arr db 00h,01h,01h,00h,00h,01h,01h,01h
res db 00h, 00h
data ends
code segment
assume cs:code, ds:data
start:
mov ax, data
mov ds, ax
mov ch, 02h
mov cl, 04h
mov bl, 00h
mov si, offset arr
mov di, offset res
l1:
mov al, 08h
mov bl, 00h
l2:
mov dl, [si]
mov dh, al
mul dl
add bl, al
mov al, dh
mov bh, 02h
div bh
inc si
dec cl
jnz l2
mov [di], bl
inc di
dec ch
jnz l1
lea si, res
mov al, [si]
mov bl, 0ah
mul bl
add al, [si+1]
int 3
code ends
end start


