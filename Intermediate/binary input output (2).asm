.MODEL SMALL
.STACK 100H
.CODE


MAIN PROC
    
    XOR BX,BX
    MOV AH,1
    INT 21H  
    
                                                                                                             
     
    
WHILE_:
    
    CMP AL,0DH
    JE CONT 
    AND AL,0FH
    SHL BX,1
    OR BL,AL       
    INT 21H
    JMP WHILE_  
    
CONT:
        
    MOV CX,16 
    
    
    
WHILE1_:
    
    CMP BX,16
    JMP EXIT 
    
    
    
    ROL BX,1
    JC CF 
    
    
      
    MOV AH,2
    MOV DL,'0'
    INT 21H  
    
    
    
    LOOP WHILE1_
    JMP EXIT
    
CF:
     MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H                                                                                                                  
      
    
    MOV AH,2
    MOV DL,'1' 
    INT 21H
    
    LOOP WHILE1_ 
    JMP EXIT
EXIT:
    
       
    MOV AH,4CH
    INT 21H   
                 
    
    MAIN ENDP

END MAIN