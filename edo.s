.data
# OUTPUT

# ZERO
zeroAsFloat: .float 0.0

# PRINTS
STR_ENTRADA: .asciiz "Ingrese Delta T: "
STR: .asciiz "\nDelta T : "
STR2: .asciiz "\nYn      : "
SALTO: .asciiz "\n"


.text
# MAIN
main:
	lwc1 $f31, zeroAsFloat


	li $v0, 4
	la $a0, STR_ENTRADA			# Imprimir entrada
	syscall
	li $v0, 6					# Guardar valor
	syscall

	#Mostrar Delta T

	la $a0, STR					# Imprimir string
	li $v0, 4
	syscall

	li $v0, 2					#Imprimir DeltaT
	add.s $f12, $f0, $f31
	syscall

	


	jal EULERMEJORADO 			# Llamar funcion


	#Mostrar Delta T
	la $a0, STR2				# Imprimir string
	li $v0, 4
	syscall

	li $v0, 2					#Imprimir DeltaT
	add.s $f12, $f15, $f31
	syscall


	
	li $v0, 10					# Salir
	syscall



# Funcion principal
EULERMEJORADO:
	li.s $f13, 2.0		#xMax
	li.s $f14, 0.0		# x
	li.s $f15, 1.0		# y
	j LOOP

PENDIENTE:
	
	li.s $f9, -2.0
	mul.s $f9, $f9, $f17
	mul.s $f9, $f9, $f17
	mul.s $f9, $f9, $f17
	add.s $f16, $f9, $f31
	jr $ra

LOOP:
	add.s $f16, $f14, $f31
	add.s $f17, $f15, $f31

	sw $ra, -4($sp)			# Guardar ra
	addi $sp, $sp, -4

	jal PENDIENTE


	add.s $f19, $f31, $f16 	# float mk = pendiente(x,y);
	add.s $f20, $f31, $f19		# clonar mk

	mul.s $f19, $f19, $f12
	add.s $f19, $f19, $f15		# 	float yPrimaNext = y + mk*xStep;

	add.s $f21,$f14, $f12 		# 	float xNext = x + xStep;
	
	add.s $f16, $f21, $f31
	add.s $f17, $f19, $f31

	jal PENDIENTE

	add.s $f18, $f16, $f31		# 	float nk = pendiente(xNext, yPrimaNext);
		
	add.s $f22, $f20, $f18		# 	float yNext = y + ((mk + nk) * xStep)/2 ;
	mul.s $f22, $f22, $f12
	li.s $f23, 2.0
	div.s $f22, $f22, $f23
	add.s $f22, $f22, $f15
		
	add.s $f14, $f21, $f31		# 	x = xNext;
	add.s $f15, $f19, $f31		# 	y = yPrimaNext;
	
	c.le.s $f14, $f13
	bc1t LOOP			# while(x<=xMax)

	lw $ra, 0($sp)			# Devolver stack ra
	addi $sp, $sp, 4

EXIT:							# Retornar
	jr $ra