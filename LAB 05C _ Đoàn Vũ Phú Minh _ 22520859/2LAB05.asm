.data 
endl :.asciiz "\n"
 max :.asciiz "Max = " 
 min :.asciiz "Min = " 
 mangso :.word 100 
 solonnhat:.asciiz "So lon nhat = " 
 somin:.asciiz "So nho nhat = " 
  
 .text
  li $v0,5 
  syscall 
  move $s1,$v0  
  la $t0,mangso 
  addi $t1,$0,0 
  nhap:
  beq $t1,$s1,exit   
    li $v0,5    
    syscall      
    sll $t2,$t1,2   
    add $t2,$t2,$t0   
     sw $v0,0($t2)          
     add $s4,$s4,$v0           
     addi $t1,$t1,1   
     j nhap 
     exit:   
     lw $s5,0($t0)   
     lw $s6,0($t0)   
     addi $t3,$0,0 
     tinhmin:   
     beq $t3,$s1,exit2     
      sll $t6,$t3,2   
      add $t6,$t6,$t0   
      lw $t7,0($t6)      
      addi $t3,$t3,1     
       slt $t8,$t7,$s5   
       beq $t8,0, tinhmax  
        move $s5,$t7         
        j tinhmin 
        tinhmax:   
        sgt $t9,$t7,$s6   
        beq $t9,0,tinhmin  
         move $s6,$t7     
          j tinhmin 
          exit2:   
          li $v0,4   
          la $a0,somin   
          syscall
          li $v0,1   
          addi $a0,$s5,0   
          syscall      
          li $v0,4   
          la $a0,endl   
          syscall      
          li $v0,4   
          la $a0,solonnhat   
          syscall      
          li $v0,1   
          addi $a0,$s6,0   
          syscall      
          li $v0,4  
           la $a0,endl   
           syscall    
           
