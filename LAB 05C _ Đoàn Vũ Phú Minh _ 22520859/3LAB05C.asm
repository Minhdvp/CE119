.data
prompt_a: .asciiz "Nhap he so a: "
prompt_b: .asciiz "Nhap he so b: "
prompt_c: .asciiz "Nhap he so c: "
result_msg: .asciiz "Nghiem cua phuong trinh: "
no_solution_msg: .asciiz "Khong co nghiem"
newline: .asciiz "\n"

.text
.globl main
main:
    # In prompt_a
    li $v0, 4
    la $a0, prompt_a
    syscall

    # Nhập hệ số a từ bàn phím
    li $v0, 5
    syscall
    move $s0, $v0   # Lưu hệ số a vào thanh ghi $s0

    # In prompt_b
    li $v0, 4
    la $a0, prompt_b
    syscall

    # Nhập hệ số b từ bàn phím
    li $v0, 5
    syscall
    move $s1, $v0   # Lưu hệ số b vào thanh ghi $s1

    # In prompt_c
    li $v0, 4
    la $a0, prompt_c
    syscall

    # Nhập hệ số c từ bàn phím
    li $v0, 5
    syscall
    move $s2, $v0   # Lưu hệ số c vào thanh ghi $s2

    # Tính delta
    mul $t0, $s1, $s1   # b^2
    mul $t1, $s0, $s2   # 4ac
    li $t2, 4
    mul $t1, $t1, $t2
    sub $t3, $t0, $t1   # delta = b^2 - 4ac

    # Kiểm tra delta
    bltz $t3, no_solution    # Nếu delta < 0, không có nghiệm

    # Tính nghiệm 1
    neg $s1, $s1     # -b
    sub $t4, $t0, $t3   # b^2 - delta
    jal sqrt_func    # Gọi hàm tính căn bậc 2
    add.s $f2, $f0, $f2    # -b + sqrt(b^2 - delta)
    div $s0, $s1, $s0    # (-b + sqrt(b^2 - delta)) / (2a)
    mtc1 $s0, $f12   # Lưu nghiệm x1 vào thanh ghi $f12

    # Tính nghiệm 2
    neg $s1, $s1     # -b
    sub $t6, $t0, $t3   # b^2 - delta
    jal sqrt_func    # Gọi hàm tính căn bậc 2
    sub.s $f4, $f0, $f2    # -b - sqrt(b^2 - delta)
    div $s0, $s1, $s0    # (-b - sqrt(b^2 - delta)) / (2a)
    mtc1 $s0, $f14   # Lưu nghiệm x2 vào thanh ghi $f14

    # In result_msg
    li $v0, 4
    la $a0, result_msg
    syscall

    # In nghiệm 1
    li $v0, 2
    mov.s $f12, $f2
    syscall

    # Xuống dòng
    li $v0, 4
    la $a0, newline
no_solution:
    # In "Khong co nghiem"
    li $v0, 4
    la $a0, no_solution_msg
    syscall

    # Kết thúc chương trình
    li $v0, 10
sqrt_func:
move $t8, $a0