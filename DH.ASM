data segment
arr db 1h, 2h, 3h
res db 0000h
data ends
code segment
assume cs:code, ds:data
start:
mov ax, data
mov ds, ax
mov cl, 02h
mov dl, 0Ah
lea si, arr
mov al, [si]
l1:
mul dl
inc si
mov bl, [si]
add al, bl
dec cl
jnz l1
mov res, al
int 3
code ends
end start
