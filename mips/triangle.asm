## Abdullah A. Zarir -- 03/03/17
## triangle.asm -- Prints out the below pattern - 
##			*
##			**
##			***
##			****
##			*****
##
## 	To implement this we will require a nested loop structure.
##	The outer loop will control the row number going from row 1
##	to row 5 and the inner loop will control the column number 
##	going from column 1 to column j (j is the line number). Inside
##	the inner we will print the '*' and just outside the inner loop
##	a newline is required to go to the next line of output.

## main --
##	1) We will start the outer loop for 5 iterations.
##	2) Inside the outer loop we start the inner loop for $t1 number of iterations
## 	3) Inside the inner loop we first print the '#' or '*'
##	4) Increament the counter for the inner loop
## 	5) Right after the inner loop print a newline
##	6) Then increament the counter for the outer loop
##	7) Exit properly
## 
## Register usage:
##	$t0 - Counter for the outer loop, i
##	$t1 - Counter for the inner loop, j
##	$t2 - is $t1 + 1
##	$v0 - For system call
##	$a0 - For passing argument to system call

.text
main:
	li $t0, 0 						# t0 is i
	outer_loop: beq $t0, 5, end_outer_loop			# if $t0 == 5 then go to label end_outer_loop, else go to next line
	
		li $t1, 0 					# t1 is j
		addi $t2, $t0, 1				# t2 = t1 + 1
		inner_loop:	beq $t1, $t2, end_inner_loop	# if $t1 == $t2 then go to label end_inner_loop, else next line
				# printing '#'
				li $a0, 35			
				li $v0, 11
				syscall
				
				addi $t1, $t1, 1		# Increament counter for the inner loop
				b inner_loop			# jump to label inner_loop
		end_inner_loop:				
		
		# printing newline
		li $a0, 10
		li $v0, 11
		syscall
	
		addi $t0, $t0, 1				# Increament counter for the outer loop
		b outer_loop
	end_outer_loop:
	
exit:
	li $v0, 10						# Exit properly
	syscall
