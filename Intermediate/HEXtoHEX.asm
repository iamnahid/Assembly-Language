.MODEL SMALL
.STACK 100H +
.DATA
STR1 DB 'TYPE A HEX: $'
STR2 DB 'THE VALUE IS: $'
.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BX,0
    
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
WHILE:
    
    CMP AL,0DH
    JE CONT
    
    CMP AL,'9'
    JG LET
    
    AND AL,0FH
    
    SHL BX,4
    OR BL,AL 
    
    MOV AH,1
    INT 21H
    
    JMP WHILE
    
LET:
    SUB AL,37H
    
    SHL BX,4
    OR BL,AL
    
    INT 21H
    
    JMP WHILE 
    
CONT:
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,STR2
    MOV AH,9
    INT 21H
    
    MOV CX,4
    
FOR:
    MOV DL,BH 
    
    SHR DL,4 
    
    CMP DL,9
    JG LET2
    
    OR DL,30H
    JMP CONT2
    
    
LET2:
    ADD DL,37H
    JMP CONT2 
    
CONT2:
    
    MOV AH,2
    INT 21H
    
    ROL BX,4
    
    LOOP FOR
    
            
            
    
EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN