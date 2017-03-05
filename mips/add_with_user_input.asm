## Abdullah A. Zarir -- 24/02/17
## add_with_user_input.asm -- Adds the value of two registers. 
##
## 	We will initialize two registers with user input
##	value and then add those and store in a third
##	register. Finally we will print the number in
##	the third register. In short A = B + C

## main --
##	1) Take user input for register $t0
##	2) Take user input for register $t1 
## 	3) Add $t0 and $t1 and put the result in $t2.
## 	4) Copy $t2 into $a0 for printing.
##	5) Set $v0 to 1 for printing integer.
##	6) Do 'syscall' to execute printing.
## 
## Register usage:
##	$t0 - B
##	$t1 - C
##	$t2 - A
##	$v0 - For system call
##	$a0 - For passing argument to system call
.text

main:

	li $v0, 5		# $v0 = 5 for taking number input from user
	syscall			# Take the input
	
	move $t0, $v0		# The input value by default is in $v0 register, copy it to $t0 register
	
	li $v0, 5		# $v0 = 5 for taking number input from user
	syscall			# Take the input
	
	move $t1, $v0		# The input value by default is in $v0 register, copy it to $t1 register
	
	add $t2, $t0, $t1	# A = B + C
	
	move $a0, $t2		# Copy $t2 into $a0
	
	li $v0, 1		# For system call
	syscall			# Execute printing operation
