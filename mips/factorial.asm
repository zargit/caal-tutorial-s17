## Abdullah A. Zarir -- 22/04/17
## factorials.asm 
##
## 	We will write a function that takes in a number 'n'
##	and produces the factorial of it using recursion.
## 	Stack pointer will be used to implement the recursive
##	function calls.

.text
main:
	li $a0, 5	# by default we will call the function with n=5
	jal fact	# calling the fact function
	
	move $a0, $v0	# after the function execution finishes, the result is in $v0
	li $v0, 1	# we print out the returned result
	syscall

exit:
	li 	$v0, 10
	syscall
fact:
	addi $sp, $sp, -8	# we allocated two space in the stack to store information of the current function state
	sw $a0, 0($sp)		# we store the current value passed in the function
	sw $ra, 4($sp)		# we store the current return address
	bge $a0, 1, fact_else	# now we check the base condition
	li $v0, 1		# if the base condition is met we return 1
	addi $sp, $sp, 8 	# we free up the space in the stack
	jr $ra			# return to function called from
fact_else:
	addi $a0, $a0, -1	# we do n = n - 1
	jal fact		# and again call fact(n-1)
	lw $t0, 0($sp)		# once it returns we load the value from the stack
	mul $v0, $v0, $t0	# then we multiply it: n * fact(n-1)
	lw $ra, 4($sp)		# then we load the return address from the stack to return to proper state
	addi $sp, $sp, 8	# we free up the space in the stack
	jr $ra			# return to function called from
	
