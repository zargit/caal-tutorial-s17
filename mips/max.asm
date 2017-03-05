## Abdullah A. Zarir -- 24/02/17
## max.asm -- Compares value of two registers and prints the bigger.
##
## 	We will initialize two registers with user input
##	value and then compare the two with 'bge' command,
##	branch if greater or equal. In short - 
##	if(A>=B) print A
##	else print B

## main --
##	1) Take user input for register $t0
##	2) Take user input for register $t1 
## 	3) Compare $t0 and $t1.
## 	4) Copy $t2 into $a0 for printing.
##	5) Set $v0 to 1 for printing integer.
##	6) Do 'syscall' to execute printing.
## 
## Register usage:
##	$t0 - A
##	$t1 - B
##	$t2 - MAX(A,B)
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
	
	bge $t0, $t1, t0_bigger # If $t0 >= $t1, jump to label t0_bigger, else go to next line
	move $t2, $t1		# Copy $t1 into $t2
	b t1_bigger		# jump to label t1_bigger
	
	t0_bigger:		# Label t0_bigger
	move $t2, $t0		# Copy $t0 into $t2
	
	t1_bigger:		# Label t1_bigger
	
	move $a0, $t2		# Copy $t2 into $a0
	li $v0, 1		# For system call
	syscall			# Execute print operation
	
