 j main

# Função: int factorial(int n)
factorial:
    addi $sp, $sp, -8        # espaço na pilha
    sw $ra, 4($sp)           # salva o return address
    sw $a0, 0($sp)           # salva argumento n

    beq $a0, $0, base_case

    # Recursão: return n * factorial(n - 1)
    addi $a0, $a0, -1        # n - 1
    jal factorial            # chamada recursiva
    lw $a0, 0($sp)           # recupera n original
    mul $v0, $a0, $v0        # n * factorial(n - 1)

    j end_factorial

base_case:
    li $v0, 1                # return 1

end_factorial:
    lw $ra, 4($sp)           # restaura return address
    addi $sp, $sp, 8         # libera espaço na pilha
    jr $ra

# Função: main
main:
    li $a0, 5                # num = 5
    jal factorial            # fact = factorial(num)
    move $s0, $v0            # salva resultado em $s0 (fact)

    # Encerrar o programa
    li $v0, 10
    syscall
