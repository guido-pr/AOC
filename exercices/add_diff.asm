j main
# Função: int add(int a, int b)
add:
    add $v0, $a0, $a1     # v0 = a + b
    jr $ra                # retorna

# Função: int negative(int a)
negative:
    sub $v0, $zero, $a0   # v0 = 0 - a
    jr $ra                # retorna

# Função: int diff(int a, int b)
diff:
    # Salvar registradores temporários na pilha
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    move $t0, $a0         # t0 = a
    move $t1, $a1         # t1 = b

    # Chamada a negative(b)
    move $a0, $t1
    jal negative
    move $t2, $v0         # t2 = negb

    # Chamada a add(a, negb)
    move $a0, $t0
    move $a1, $t2
    jal add
    # Resultado em $v0 (difference)

    # Restaurar registradores
    lw $ra, 4($sp)
    lw $a0, 0($sp)
    addi $sp, $sp, 8
    jr $ra

# Função: main
main:
    # Suponha a = 10, b = 3
    li $s0, 10            # a
    li $s1, 3             # b

    # c = add(a, b)
    move $a0, $s0
    move $a1, $s1
    jal add
    move $s2, $v0         # c

    # d = diff(a, b)
    move $a0, $s0
    move $a1, $s1
    jal diff
    move $s3, $v0         # d

    # Encerrar o programa (no SPIM, por exemplo)
    li $v0, 10
    syscall
