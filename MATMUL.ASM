ASSUME  CS:code,DS:data
data  segment
mat1  db  01h,01h,02h,01h,01h,01h
mat2  db  01h,01h,01h,01h,01h,01h,01h,01h
mat3  dw  012h dup(?)
data  ends
code  segment
start:MOV  ax,data
			MOV  ds,ax
			MOV  ch,03h
			MOV  bx,offset  mat3
			MOV  SI,offset  mat1
			
nextrow:MOV  DI,offset  mat2
                        MOV  cl,04h
nextcol:MOV  dl,02h
			MOV  bp,0000h
			MOV  ax,0000h
next_ele: MOV  al,[SI] 
			MUL  byte ptr[DI] 
			ADD  bp,ax
			INC  SI
                        ADD  DI,04h
			DEC dl
			JNZ  next_ele
                        SUB  DI,07h
			SUB  SI,02h
			MOV  [bx],bp
			INC  bx
			DEC  cl
			JNZ  nextcol
			ADD  SI,02h  
			DEC  ch
			JNZ  nextrow
			MOV  ah,4ch
			INT  3
			code ends
			end  start
