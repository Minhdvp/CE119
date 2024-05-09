.data
prompt: .asciiz "Nhap mot so nguyen lon hon 50: "
result: .asciiz "Cac so nguyen to nho hon so da nhap: "

.text
.globl main
main:
    # In prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Nhập số từ bàn phím
    li $v0, 5
    syscall
    move $t0, $v0   # Lưu số đã nhập vào thanh ghi $t0

    # In result
    li $v0, 4
    la $a0, result
    syscall

    # Liệt kê các số nguyên tố nhỏ hơn số đã nhập
    li $t1, 2       # Gán $t1 = 2 (số nguyên tố đầu tiên)
loop:
    bge $t1, $t0, exit    # Nếu $t1 >= $t0, thoát khỏi vòng lặp

    # Kiểm tra $t1 có phải số nguyên tố không
    move $a0, $t1   # Lưu giá trị $t1 vào $a0 để truyền vào hàm kiểm tra
    jal is_prime    # Gọi hàm kiểm tra số nguyên tố

    # Nếu là số nguyên tố, in ra màn hình
    beqz $v0, continue   # Nếu $v0 == 0 (không phải số nguyên tố), nhảy qua vòng lặp tiếp theo
    j print_prime

print_prime:
    li $v0, 1       # In số nguyên tố
    move $a0, $t1
    syscall

continue:
    addi $t1, $t1, 1     # Tăng $t1 lên 1
    j loop

exit:
    li $v0, 10
    syscall

# Hàm kiểm tra số nguyên tố
# Đầu vào: $a0 - số cần kiểm tra
# Đầu ra: $v0 = 0 nếu không phải số nguyên tố, $v0 = 1 nếu là số nguyên tố
is_prime:
    move $t2, $a0   # Lưu giá trị $a0 vào $t2
    li $t3, 2       # Gán $t3 = 2 (số nguyên tố đầu tiên)

is_prime_loop:
    beq $t3, $t2, is_prime_exit   # Nếu $t3 == $t2, thoát khỏi vòng lặp

    div $t2, $t3
    mfhi $t4        # Lưu phần dư vào $t4

    beqz $t4, is_prime_not_prime  # Nếu $t4 == 0, nhảy đến nhãn is_prime_not_prime

    addi $t3, $t3, 1    # Tăng $t3 lên 1
    j is_prime_loop

is_prime_not_prime:
    li $v0, 0       # Không phải số nguyên tố
    jr $ra

is_prime_exit:
    li $v0, 1       # Là số nguyên tố
    jr $ra