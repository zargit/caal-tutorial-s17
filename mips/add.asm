## Abdullah A. Zarir -- 24/02/17
## add.asm -- Adds the value of two registers. 
##
## 	We will initialize two registers with constant
##	value and then add those and store in a third
##	register. Finally we will print the number in
##	the third register. In short A = B + C

## main --
##	1) Initialize register $t0 with a constant value
##	2) Initialize register $t1 with a constant value
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
	li $t0, 1 		# B = 1
	li $t1, 2 		# C = 2
	
	add $t2, $t1, $t0 	# A = B + C
	
	move $a0, $t2 		# Copy $t2 into $a0
	li $v0, 1 		# For system call
	syscall 		# Execute printing operation
	
