.data 
 	.text 
 	main:  li $v0,5 
syscall 
move $s0,$v0 
 
li $v0,5 
syscall 
move $s1,$v0 
 
li $v0,5 
syscall 
move $s2,$v0 
li $v0,5 
syscall 
move $s3,$v0 
 
 	move $a0,$s0 
 
 	move $a1,$s1 
 
 	move $a2,$s2 
 
 	move $a3,$s3 
 
 	jal proc_example 
move $a0,$v0 
li $v0,1 
syscall 
j exit 
proc_example: 
addi $sp,$sp,-4 
sw $s0,0($sp) 
add $t0,$a0,$a1 
add $t1,$a2,$a3 
sub $s0,$t0,$t1 
move $v0,$s0 
lw $s0,0($sp) 
addi $sp,$sp,4 
jr $ra
exit: