# loop counter
li $t0,0
# divisor thing
li $t1,0
# answer
li $t2,0

loop:
	# increment counter
	add $t0,$t0,1
	# if loop counter > 999, exit.
	bgt $t0,999,exit
	
	# divide counter by 3, get remainder
	# if remainder is 0, go to adder
	div $t0,3
	mfhi $t1
	beq $t1,0,adder
	
	# divide counter by 5... etc.
	div $t1,$t0,5
	mfhi $t1
	beq $t1,0,adder
	
	j loop

adder:
	add $t2,$t2,$t0
	j loop

exit:
	li $v0, 10
	syscall