## Abdullah A. Zarir -- 24/02/17
## hellow-world.asm -- Prints out "Hello World!"
##
## 	First we will declare a data label of type 
##	.asciiz containing the string "Hello World!".
##	Then in the main directive we will load and 
## 	print it in the console.

## main --
##	1) We will use 'la' command to load the string.
##	2) Set system command to 4 in $v0 for print string.
## 	3) Copy the address of the string to $a0.
## 	4) Do 'syscall' to execute print operation.
## 
## Register usage:
##	$t0 - Address of the string
##	$v0 - For system call
##	$a0 - For passing argument to system call

.data

hello_world: .asciiz "Hellow World!"

.text

main:				# Staring point of execution	
	la $t0, hello_world	# Loading the address to $t0

	li $v0, 4		# For printing operation
	move $a0, $t0		# Setting argument for syscall
	syscall			# Execute print operation
