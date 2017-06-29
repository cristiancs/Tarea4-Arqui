	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI0_0:
	.long	3221225472              ## float -2
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_pendiente
	.p2align	4, 0x90
_pendiente:                             ## @pendiente
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	mulss	LCPI0_0(%rip), %xmm0
	mulss	%xmm1, %xmm0
	mulss	%xmm1, %xmm0
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI1_0:
	.long	1065353216              ## float 1
LCPI1_1:
	.long	3221225472              ## float -2
LCPI1_2:
	.long	1073741824              ## float 2
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_euler_mejorado
	.p2align	4, 0x90
_euler_mejorado:                        ## @euler_mejorado
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	movss	LCPI1_0(%rip), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	xorps	%xmm2, %xmm2
	movss	LCPI1_1(%rip), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	movss	LCPI1_2(%rip), %xmm4    ## xmm4 = mem[0],zero,zero,zero
	.p2align	4, 0x90
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movaps	%xmm1, %xmm5
	movaps	%xmm2, %xmm1
	mulss	%xmm3, %xmm1
	mulss	%xmm5, %xmm1
	mulss	%xmm5, %xmm1
	mulss	%xmm0, %xmm1
	addss	%xmm5, %xmm1
	addss	%xmm0, %xmm2
	ucomiss	%xmm2, %xmm4
	jae	LBB1_1
## BB#2:
	movaps	%xmm1, %xmm0
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI2_0:
	.long	1065353216              ## float 1
LCPI2_1:
	.long	3221225472              ## float -2
LCPI2_2:
	.long	1073741824              ## float 2
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.1(%rip), %rdi
	leaq	-4(%rbp), %rsi
	xorl	%eax, %eax
	callq	_scanf
	movss	LCPI2_0(%rip), %xmm4    ## xmm4 = mem[0],zero,zero,zero
	xorps	%xmm3, %xmm3
	movss	-4(%rbp), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	movss	LCPI2_1(%rip), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	movss	LCPI2_2(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	.p2align	4, 0x90
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movaps	%xmm4, %xmm5
	movaps	%xmm0, %xmm6
	addss	%xmm3, %xmm6
	mulss	%xmm1, %xmm3
	mulss	%xmm5, %xmm3
	mulss	%xmm5, %xmm3
	mulss	%xmm0, %xmm3
	movaps	%xmm3, %xmm4
	addss	%xmm5, %xmm4
	ucomiss	%xmm6, %xmm2
	movaps	%xmm6, %xmm3
	jae	LBB2_1
## BB#2:
	cvtss2sd	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	cvtss2sd	%xmm4, %xmm1
	leaq	L_.str.2(%rip), %rdi
	movb	$2, %al
	callq	_printf
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Ingrese Delta T: "

L_.str.1:                               ## @.str.1
	.asciz	"%f"

L_.str.2:                               ## @.str.2
	.asciz	"Delta T : %f\nYn      : %f\n"


.subsections_via_symbols
