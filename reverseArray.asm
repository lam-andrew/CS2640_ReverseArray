# Prompt: Write a program in assembly that reverses the elements of the given array. Use any registers and instructions as necessary: 
	# int array = [5, 4, 3, 2, 1]
# Author: Andrew Lam & Tyler Hipolito 
# Course: CS2640.01 
# Due Date: 12/05/2022
# Objective: Implement stack data structure to reverse the elements of a given array and print them out

# macro to print user input string 
.macro printS(%s) 
	li $v0, 4 
	la $a0, %s
	syscall 
.end_macro 

# macro that prints a given interger 
.macro ints(%x)  
 	li $v0, 1 
 	move $a0, %x 
 	syscall 
.end_macro 

# macro that exits the program 
.macro exit
	li $v0, 10 
	syscall 
.end_macro

.data 
	prompt1: .asciiz "\nArray elements are: "
	prompt2: .asciiz "\nNew array is: "
	space: .asciiz " "
	array: .word 5, 4, 3, 2, 1	

.text 
main:
	# print out prompt1 to the user 
	printS(prompt1)
	
	# initialize counter variables, $t0 & $t1, with 0 
	li $t0, 0
	li $t1, 0
	
	# jump and link to loop1 label
	jal loop1
	
main2:
	# print out prompt2 to the user 
	printS(prompt2)
	
	# jump and link to loop2 label
	jal loop2
	
	
	
##### print out elements of the original array #####
loop1: 
	# load element at the position of $t0 into $t2
	lw $t2, array($t0)
	
	# print out the value $t0 
	ints($t2)
	
	# print out space 
	printS(space)
	
	
	##### PUSH ONTO STACK #####
	# push integer $t1 onto the stack
	sub $sp, $sp, 4		# moves $sp downward to make space for our next integer (size word - 4 bytes) on the stack 
	sw $t2, ($sp)		# push $t0 onto the stack (store value in $t2 into $sp) 

	
	# increase $t0 by 4, the size of word (so we can go to the next word in array) 
	add $t0, $t0, 4
	# if $t0 is less than 20, run the loop1 (since each word is 4 bytes, we have 5 elements, we know there are 20 bytes total) 
	blt $t0, 20, loop1 
	
	# jump to main2 label
	j main2
	
	
##### reverse the elements of the array using stack #####
loop2: 
	
 	##### POP OFF THE STACK #####
	# pop off stack and load into a register 
	lw $t2, ($sp)		# move the item at the top of the stack into $t1 
	add $sp, $sp, 4		# add 4 to move $sp upward and point to the second element on the stack (now making it the top element) 
	
	# print out the popped item 
	ints($t2)
	
	# print space 
	printS(space) 
	
	# counter to check if we got all array elements 
	add $t1, $t1, 4
	# branch back to loop2 
	blt $t1, 20, loop2 

	exit 
