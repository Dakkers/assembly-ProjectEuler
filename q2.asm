# fibonacci terms
li $t0,1
li $t1,1
li $t2,1
# remainder
li $t3,0
# answer
li $t6,0

loop:
	# update fibonacci terms
	addi $t0,$t1,0
	addi $t1,$t2,0
	add $t2,$t1,$t0
	
	# if term > 4000000, exit
	bgt $t2,4000000,exit
	
	# if term is even, add it...
	div $t3,$t2,2
	mfhi $t3
	beq $t3,0,adder
	
	j loop
	
	
adder:
	add $t6,$t6,$t2
	j loop


exit:
	li $v0,10
	syscall