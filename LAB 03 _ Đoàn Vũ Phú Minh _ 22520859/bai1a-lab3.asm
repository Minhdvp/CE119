.data 
array1: .word  5, 6, 7, 8, 1, 2, 3, 9, 10, 4 #khai bao mang array1
size1: .word 8 # khai bao phan tu mang array 1
array2: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2: .word 16 
ar1: .asciiz "Phan tu mang arr1 la: " 
ar2: .asciiz "\nPhan tu mang arr2 la: " 
space: .asciiz " " 
.text 
arr1: 
la $a0, ar1 #$a0 = ar1
li $v0, 4 # $v0 =4
syscall 
la $s0, array1  #$s0 la dia chi nen cua mang array1
addi $t2, $t2, 0 # t2=0
addi $t3, $t3, 10 # t3=10
loop: 
beq $t2, $t3, arr2  # $t2 =$t3 nhay den arr2
la $v0, 1  # $v0 =1
lw $t1, 0($s0)  # lay gtri trong $s0 vao $t1

add $a0, $t1, $0  # $a0 =$t1
syscall  # in ra cac phan tu tai $s0
la $a0, space # in ra khoang trong
li $v0, 4 
syscall 


addi $s0, $s0, 4 # $s0 = $s0 +4 ( work ke tiep)
addi $t2, $t2, 1 #$t2 = $t2 +1
j loop # nhay toi loop
arr2: 
la $a0, ar2 
li $v0, 4 
syscall # in ra ar2
la $s1, array2 # gan $s1 = gtri nen cua array2
addi $t2, $t2, 0 # $t2=0
addi $t3, $t3, 16 # $t3=16
loop2: 
beq $t2, $t3, Exit # neu $t2= $t3 thi nhay toi Exit
la $v0, 1 #$v0=1
lb $t1, 0($s1) # doc gtri $t1 vao $t1
add $a0, $t1, $0 # $a0=$t1
syscall # in ra phan tu tai $s1
la $a0, space 
li $v0, 4 
syscall # in ra khoang trong
addi $s1, $s1, 1 # 4s1 = $s1+1 ( chuyen toi byte ke tiep)
addi $t2, $t2, 1 #$t2=$t2+1
j loop2 
Exit:
