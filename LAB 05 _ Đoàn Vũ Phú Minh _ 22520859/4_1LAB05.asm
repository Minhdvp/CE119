.text
bne $s3, $s4, else #kiểm tra nếu không bằng thì nhảy tới nhãn else
add $s0, $s1, $s2 #f= g+h
j exit
else:
	sub $s0, $s1, $s2 #f=g-h
exit: