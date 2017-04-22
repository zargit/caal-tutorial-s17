## Abdullah A. Zarir -- 22/04/17
## writing_number_in_file.asm

.data

filename: .asciiz "output.txt"
char_array: .space 100

.text

main:
	#open a file
	li $v0, 13
 	la $a0, filename
 	li $a1, 1
 	li $a2, 0
 	syscall
 	
 	move $s0, $v0 # saving the file pointer in $s1
 	
 	# take a number input from the user
 	li $v0, 5
 	syscall
 	
 	move $t1, $v0 # copy the input into $t1
 	
 	la $t2, char_array # load the array address into $t2
 	addi $t2, $t2, 99 # move the pointer $t2 to the last index of the array
 	
 	li $t3, 0 # a counter for counting the total number of digits in the input number
 	
 	while_not: 
 		ble $t1, 0, end_while # while (n > 0) ... t1 is 'n'
 		rem $t4, $t1, 10 # r = n % 10
 		div $t1, $t1, 10 # n = n / 10
 		
 		addi $t4, $t4, '0' # getting ascii equivalent character of the digit
 		sb $t4, 0($t2) # storing the characeter in the array at index $t2
 		
 		addi $t2, $t2, -1 # decreamenting the array index by 1
 		addi $t3, $t3, 1 # increamenting the digit counter by 1
 		
 		b while_not
 	end_while:
 	
 	addi $t2, $t2, 1
 	
 	# visualizing the char_array
 	#
 	# indexes: 0 1 2 3 4 5 ...... 95 96 97 98 99
 	# values:  _ _ _ _ _ _ ......  _  _  1  2  6
 	#
 	# Now, we want only to write "127" into the file, that means starting from index 97 we need to print the next 3 digit
 	# That is what we will do, we have the starting index in register $t2 and the total number of digit count in register $t3
 	
 	# writing to file
 	li $v0, 15
 	move $a0, $s0 # file to write to
 	move $a1, $t2 # starting point of write data
 	move $a2, $t3 # how many bytes to write
 	syscall
  	
  	# close the file
  	li $v0, 16
	move $a0,$s1
	syscall
	
exit:
li $v0, 10
syscall	 		
