.data 
array1: .word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4 
size1: .word 10 
array2: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 
size2: .word 16 
str1: .asciiz "Dia chi mang: " 
str2: .asciiz "\nDia chi phan tu: " 
str3: .asciiz "\nPhan tu la: " 
space: .asciiz " " 
.text 
la $s1, array1 # luu gia tri nen mang array1
la $s2, array2 # luu gtri nen mang array2
la $a0, str1 
li $v0, 4 
syscall # in ra chuoi str1
li $v0, 5 
syscall 
addi $t1, $v0, 0 # $t1=$v0 
beq $t1, 1, arr1 # if $t1=1, nhay toi arr1
beq $t1, 2, arr2 # if $t1 =2 , nhay toi arr2
arr1: 
li $s5,0 #$s5 =0
la $a0, str2 
li $v0, 4 
syscall # in ra chuoi str2
li $v0, 5 # nhap gtri $vo
syscall 
addi $t0, $v0, 0 
loop1: #$t0 = $v0
beq $s5, $t0, out1 # if $s5=$t0 , nhay toi out1
addi $s5, $s5, 1 # $s5 = $s5 +1
sll $s6, $s5, 2 # $s6 = $s5 *4
j loop1 
out1: 
add $s7, $s1, $s6 # $s7 = $s1 +$s6
lw $t0, 0($s7) # doc gtri $s7 vao $t0
la $a0, str3 
li $v0, 4 
syscall # xuat ra chuoi str3
add $a0, $t0, 0 # $a0 =%t0
li $v0, 1 # in ra $a0
syscall 
j Exit 
arr2: 
la $a0, str2 
li $v0, 4 
syscall # in ra str2
li $v0, 5 
syscall # nhap $v0
addi $t2, $v0, 0  #$t2 = $v0
loop2: 
beq $t3, $t2, out2 # if $t3 = $t2, nhay toi out2
addi $t3, $t3, 1 # $t3 = $t3+1 
j loop2 # nhay toi loop2
out2: 
add $t5, $s2, $t3 # $t5 =$t2+$t3
lb $t4, 0($t5) # doc thanh ghi $t5 vao $t4
la $a0, str3
li $v0, 4 
syscall # in ra chuoi str3
add $a0, $t4, 0 
li $v0, 1 
syscall # in ra $a0
j Exit 
Exit:
