.MODEL SMALL
.STACK 100H

.DATA
M1 DB 'TYPE A HEX NUM: $'
M2 DB 0DH,0AH,'THE VALUE IS: $'  
X DB ?
M3 DB 'NUMBER OF 1 IS: $'

.CODE
MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    XOR BX,BX 
    
    MOV X,0
    
    MOV AH,1
    INT 21H 
    
    CMP AL,39H
    JG LET
    
    AND AL,0FH 
    ROL BL,4
    OR BL,AL
        
    JMP CONT
       
LET:
    SUB AL,37H 
      
    OR BL,AL
      
CONT:
  
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    ROL BL,4
    MOV CX,4  
    
PRINT:

    ROL BL,1
    JC P1
    
    MOV AH,2
    MOV DL,'0'
    INT 21H
    
    LOOP PRINT
    JMP EXIT
       
P1:
  
    MOV AH,2
    MOV DL,'1'
    INT 21H 
 
    INC X
    LOOP PRINT
       
       
      
EXIT: 
       
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
       
    LEA DX,M3
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,X
    
    ADD DL,30H
    INT 21H
   
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
