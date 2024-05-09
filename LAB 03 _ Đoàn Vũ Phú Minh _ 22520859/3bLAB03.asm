.data
strl: .asciiz "Nhap so luong phan tu: "#24
str2: .asciiz "\nNhap phan tu thu"#19
str3: .asciiz":"#3
str4: .asciiz "\nNhap i: "#10
str5: .asciiz "\nNhap j: "#10
array: .word
.text
lui $1,0x00001001
addi $s3, $1,0
addi $a0,$1,0
addi $v0,$0,4#xuat strl
syscall
addi $v0, $0, 5
syscall
 addi $s1, $v0, 0
addi $t9, $1,0
sll $t8, $s1, 2
add $t8, $t9, $t8
IN:
addi $a0,$1,24
addi $v0,$0,4#xuat str2
syscall
addi $t1, $t1, 1# xuất stt 
addi $a0, $t1, 0
addi $v0, $0, 1
syscall
addi $a0,$1,43
addi $v0,$0,4#xuat str3
syscall
addi $v0, $0, 5
syscall
sw $v0, 0($t9)
addi $t9, $t9, 4
bne $t9, $t8, IN
addi $a0,$1,46
addi $v0,$0,4#xuat str4
syscall
addi $v0, $0, 5
syscall 
addi $s0, $v0, 0
addi $a0,$1,56
addi $v0,$0,4#xuat str5 
syscall
addi $v0, $0, 5
syscall 
addi $s1, $v0, 0
sll $t1, $s0, 2
add $s3, $s3, $t1 
slt $t0, $s0, $s1
beq $t0, $0, J
sw $s0, 0($s3)
j EXIT
J:
sw $s1, 0($s3)
EXIT:
