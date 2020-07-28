data segment
s db 'a','b','c','c','a'
data ends
code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax
lea si,s
mov di, offset s
mov bx, 05h
sub bx, 01h
mov cx, length s
l1:
    mov al,[si]
    mov ah,[di+bx]
    cmp al,ah
    jnz ex
    inc si
    dec cx
    dec bx
    jz done
    jmp near ptr l1
ex: mov ax,0000h
    jmp near ptr l2
done: mov ax,0001h
l2:
code ends
end start
