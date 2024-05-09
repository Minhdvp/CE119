addi $s0, $0, 5 #a=5
addi $s1, $0, 6 #b=6
sw $s0, 0($s2) #Lưu giá trị a vào memory
sw $s1, 0($s3) #Lưu giá trị b vào memory
lw $s0, 0($s2) #Lấy giá trị a từ memory từ địa chỉ 0($s2)
lw $s1, 0($s3) #Lấy giá trị b từ memory từ địa chỉ 0($s3)
sub $s4, $s0, $s1 # c=a-b
add $s5, $s0, $s1 # d=a+b