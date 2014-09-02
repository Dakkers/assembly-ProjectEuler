	.text
main:
	li $t0,0	# sum of squares, 1^2 + ... + 100^2
	li $t1,0	# square of sums, (1 + ... + 100)^2
	li $t2,0	# counter
	li $t3,0	# square of counter
	li $t4,0	# answer
	b loop
	
loop:
	addi $t2,$t2,1		# increment counter
	mult $t2,$t2		# square of counter
	
	add $t1,$t1,$t2		# update square of sums
	
	mflo $t3		# get square of counter
	add $t0,$t0,$t3		# update sum of squares
	
	beq $t2,100,exit	# if counter == 100, exit
	b loop
		
exit:
	mult $t1,$t1		# finally square the square of sums
	mflo $t1
	sub $t4,$t1,$t0
	li $v0,10
	syscall	