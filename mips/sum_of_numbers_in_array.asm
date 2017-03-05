## Abdullah A. Zarir -- 03/03/17
## sum_of_numbers_in_array.asm -- Sums all numbers in an Array.
##
## 	We will initialize a number array in the data section
##	with some fixed amount of numbers. The type used is .word,
##	which is equivalent to 'int' in C/C++. Then in the main we
##	go through the array elements one by one add add them in 
##	another register. 

## main --
##	1) Load the address of the array in $to.
##	2) Initialize $t1 with 10 for running the loop 10 times.
##	3) Initialize $s0 = 0, to later perform the sum in it.
##	4) Create the loop label.
##	5) Write the stopping condition, when $t1 becomes 0, stop.
##	6) Load the value pointed by the address $t0 into $t2.
##	7) Add it, $s0 = $s0 = $t2
##	8) Increament the address in $t0 by 4 to get the next number.
##	9) Decreament the counter $t1 to move closer to the stopping condition.
##	10) Now print the sum.
## 	11) Exit the program properly.
## 
## Register usage:
##	$t0 - Address if the array nums
##	$t1 - Loop counter
##	$t2 - Loaded value from array
##	$s0 - Sum
##	$v0 - For system call
##	$a0 - For passing argument to system call
.data

nums: .word 1,2,3,4,5, 6,7,8,9,10

.text
main:

	la $t0, nums 		# Loading the array address to $t0
	li $t1, 10		# Init $t1 = 10
	li $s0, 0  		# Sum = 0
	loop: 	beqz $t1, end_loop # Starting loop, if $t1 == 0 then jump to label end_loop, else go to next line
		
		lw $t2, 0($t0)     # Load the value from array to $t2
		add $s0, $s0, $t2  # Sum = Sum + t2
		
		addi $t0, $t0, 4 # Increasing the address to go to the next number in the array, +4 for four bytes
		subi $t1, $t1, 1 # Decreasing the counter to move closer to the stopping condition, which is zero
		b loop		 # jump to label loop
	end_loop:		 # Label end_loop
	
	move $a0, $s0 		# Copy $t2 into $a0
	li $v0, 1 		# For system call
	syscall 		# Execute printing operation
	
exit:
	li $v0, 10		# For system call
	syscall			# Exit properly
