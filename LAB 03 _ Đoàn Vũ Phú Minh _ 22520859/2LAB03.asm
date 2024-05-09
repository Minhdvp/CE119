.data
array1: .word 5,6,7,8,1,2,3,9,10,4
size1:.word 10
array2:.byte 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
size2: .word 16
array3:.space 8
size3: .word 8
string1:.asciiz "Mang 1: " #76
string2: .asciiz "\nMang 2: " #85
str4:.asciiz "\nNhap mang thu may: " #95
str5: .asciiz "\nNhap phan tu thu may: " #116
str6: .asciiz "\nPhan tu do la: " #140
.text
#in array 1
addi $v0, $zero, 4
lui $1, 0x00001001
ori $a0, $1, 76
syscall
lui $1, 0x00001001
addi $t1, $1, 0
addi $t2, $1, 40
work1:
lw $a0,0($t1) 
addi $v0, $0, 1
syscall 
addi $t1, $t1, 4
slt $t3, $t1, $t2
bne $t3, $0, work1
#in array2
addi $v0,$zero,4
lui $1,0x00001001
ori $a0, $1,85
syscall
addi $t1, $t1, 4
addi $t2, $t1, 16
addi $t3, $t2, 4
addi $t4, $t3, 8
addi $t8, $t2, 0
work2:
lb $a0, 0($t1)
slt $t7, $t3, $t4
beq $t7, 40, work2.1
addi $t2, $t2, -1
lb $t5,0($t2)
add $t5, $t5, $a0
sb $t5, 0($t3)
addi $t3, $t3, 1
work2.1:
addi $t1, $t1, 1
addi $v0, $0, 1
syscall
slt $t6, $t1, $t8
bne $t6, $0, work2
#Nhap
addi $v0, $zero, 4
lui $1, 0x1001
ori $a0, $1, 95
syscall
addi $v0, $0, 5
syscall 
addi $s1, $v0, 0
#Nhap phan tu can lay
addi $v0, $zero, 4
lui $1, 0x000001001
ori $a0, $1, 116
syscall
addi $v0,$0,5
syscall
addi $s2, $v0, 0
#Xuat phan tu
addi $v0, $zero, 4
lui $1, 0x00001001
ori $a0, $1, 140
syscall
addi $t0, $0, 1
beq $s1, $t0, else1
addi $t0,$t0,1
beq $s1, $t0, else2
addi $t0, $t0, 1
beq $s1, $t0, else3
else1:
sll $t2, $s2, 2
add $t9, $1, $t2
lw $a0, 0($t9)
j done
else2:
addi $t2, $s2, 44
add $t9, $1, $t2
lb $a0,0($t9)
j done
else3:
addi $t2, $s2, 64
add $t9, $1, $t2
lb $a0, 0($t9)
done:
addi $v0, $0, 1
syscall






















































