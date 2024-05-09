.data 
array1: .word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4 #khai b�o ph?n t? m?ng array1 
size1: .word 10 #khai b�o k�ch th?c m?ng array1 
array2: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 
size2: .word 16 
array3: .space 8 
size3: .word 8 
ar3: .asciiz "\nPhan tu mang array3 la: " #khai b�o chu?i ar3 
space: .asciiz " " #khai b�o k� t? kho?ng tr?ng 
.text 
la $s0, array3 #l?u gia tri  nen mang array3 vao thanh ghi $s0
la $s1, array2 #luu gtri nen mang array2 vao thanh ghi $s1
li $t0, 8 
li $t1, 0 
la $a0, ar3 
li $v0, 4 # in ra chuoi ar3
syscall 
main: 
slt $t3, $t1, $t0 # if  $t1 < $t0  , $t3 =1
beq $t3, 0, Exit # $t3 =0 ,nhay toi Exit
add $t4, $s1, $t1 # $t4= $t1+$t1
lb $t5, 0($t4) # doc gtri $t4 vao $t5
li $t6, 16 #$t6 = 16
addi $a0, $t6, -1  # $a0 = $t6-1 (size 2-1)
sub $a1, $a0, $t1 # $a1 = $a0 -$t1 ( size 2-1-i)
add $t7, $s1, $a1 # cong them dia chi nen cua mang arrray2
lb $t8, 0($t7) # doc gtri $t7 vao $t8
add $a2, $s0, $s3 #$a2= $s0 + $s3
lb $s5, 0($a2) # doc gtri $a2 vao $s5
add $s4, $t5, $t8 # $s4 =$t5+ $t8
addi $s5, $s4, 0 # $s5 =$s4
addi $a0, $s5, 0 # $a0 =$s5
li $v0, 1 
syscall # in ra $s5
la $a0, space # in ra khoang trong
li $v0, 4  
syscall 
sll $s3, $s3, 2 #$s3*=4 
addi $t1, $t1, 1 #$t1+=1
j main 
Exit:


