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

	# print out prompt1 to the user 
	printS(prompt1)
	
	# initialize counter variable, $t0, with 0 
	li $t0, 0
	
##### print out elements of the original array #####
loop: 
	# load element at the position of $t0 into $t1 
	lw $t1, array($t0)
	
	# print out the value $t0 
	ints($t1)
	
	# print out space 
	printS(space)
	
	
	##### PUSH ONTO STACK #####
	# push integer $t1 onto the stack
	sub $sp, $sp, 4		# moves $sp downward to make space for our next integer (size word - 4 bytes) on the stack 
	sw $t1, ($sp)		# push $t0 onto the stack (store value in $t0 into $sp) 
	
	
	# increase $t0 by 4, the size of word (so we can go to the next word in array) 
	add $t0, $t0, 4
	# if $t0 is less than 20, run the loop (since each word is 4 bytes, we have 5 elements, we know there are 20 bytes total) 
	blt $t0, 20, loop 
	
	
##### reverse the elements of the array using stack #####
loop1: 
	# pop off stack and load into a register 
	# print out the popped item 
	
	# counter to check if we got all array elements 
	# branch back to loop1 
	
	
	
	# print out prompt2 to the user 
	printS(prompt2)
	
	# print out the new array elements  

	exit 
