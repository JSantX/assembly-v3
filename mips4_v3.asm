.data
	msg1:.asciiz "Digite nota 1: "
	msg2:.asciiz "Digite nota 2: "
	msg3:.asciiz "Digite nota 3: "
	msg4:.asciiz "Digite nota 4: "
	
	apr:.asciiz "Aprovado"
	exa:.asciiz "Exame"
	rep:.asciiz "Reprovado"
.text
.globl main
main:
	#nota 1
	li $v0,4
	la $a0,msg1
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	#nota 2
	li $v0,4
	la $a0,msg2
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	#nota 3
	li $v0,4
	la $a0,msg3
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	
	#nota 4
	li $v0,4
	la $a0,msg4
	syscall
	
	li $v0,5
	syscall
	move $t3,$v0
	
	li $t5,4
	
	add $t4,$t0,$t1
	add $t4,$t4,$t2
	add $t4,$t4,$t3
	
	div $t6,$t4,$t5
	
	bge $t6,6,aprov
	blt $t6,3,reprov
	j exame

aprov:
	li $v0,4
	la $a0,apr
	syscall
	j fim
	
reprov:
	li $v0,4
	la $a0,rep
	syscall
	j fim

exame:
	li $v0,4
	la $a0,exa
	syscall
	j fim

fim:
	li $v0,10
	syscall
