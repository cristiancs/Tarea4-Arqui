.data
# OUTPUT
RESULTADO: .word 0

# PRINTS
STR_ENTRADA: .asciiz "Ingrese Delta T: "
STR: .asciiz "\nDelta T : "
STR2: .asciiz "\nYn      : "
SALTO: .asciiz "\n"

.text
# MAIN
main:
	la $a0, STR_ENTRADA			# Imprimir entrada
	li $v0, 4
	syscall
	li $v0, 5					# Guardar valor
	syscall
	add $a0, $v0, $zero			# Pasar a input de funcion #
	jal EULERMEJORADO 			# Llamar funcion

	# Imprimir valor
	add $t0, $v0, $zero			# Auxiliar
	la $a0, STR					# Imprimir string
	li $v0, 4
	syscall
	add $a0, $t0, $zero			# Imprimir resultado
	sw $a0, RESULTADO			# Guardar resultado
	li $v0, 1
	syscall
	la $a0, SALTO				# Imprimir salto

	# Imprimir valor 2
	add $t0, $v1, $zero			# Auxiliar
	la $a1, STR2					# Imprimir string
	li $v1, 4
	syscall
	add $a1, $t0, $zero			# Imprimir resultado
	sw $a1, RESULTADO			# Guardar resultado
	li $v1, 1
	syscall
	la $a1, SALTO				# Imprimir salto


	li $v0, 4
	syscall
	li $v0, 10					# Salir
	syscall

# Funcion principal
EULERMEJORADO:
	add $s0, $zero, 2		# xMax
	add $s1, $zero, 1		# x
	add $s2, $zero, 0		# y
	j LOOP

PENDIENTE:
	add $t6, $v0, $zero
	add $t7, $v1, $zero
	li $t5, -2
	mult $t6, $t5
	mflo $t6
	mult $t6, $t6
	mflo $t6
	mult $t6, $t6
	mflo $t6
	add $v0, $t6, $zero
	jr $ra

LOOP:
	add $v0, $s1, $zero
	add $v1, $s2, $zero

	jal PENDIENTE

	add $t0, $zero, $v0 	# float mk = pendiente(x,y);
	add $t1, $zero, $t0

	mult $t1, $a0
	mflo $t1
	add $t2, $t1, $t0		# 	float yPrimaNext = y + mk*xStep;

	add $t3,$s1, $a0 		# 	float xNext = x + xStep;
	
	add $v0, $t3, $zero
	add $v1, $t2, $zero
	jal PENDIENTE
	add $t0, $zero, $v0		# 	float nk = pendiente(xNext, yPrimaNext);
		
	add $t4, $t0, $t0		# 	float yNext = y + ((mk + nk) * xStep)/2 ;
	mult $t4, $a0
	mflo $t4
	li $t0, 2
	div $t4, $t0
	mflo $t4
	add $t4, $s2, $t4
		
	add $s1, $zero, $t3		# 	x = xNext;
	add $s2, $zero, $t4		# 	y = yPrimaNext;
	
	slt $t0, $s1, $s0
	bne $t0, $zero, LOOP			
	beq $s1, $s0, LOOP			# while(x<=xMax)

	add $v0, $s2, $zero			# Si termino: guardar actual
	add $v1, $a0, $zero			# Si termino: guardar delta T


EXIT:							# Retornar
	jr $ra