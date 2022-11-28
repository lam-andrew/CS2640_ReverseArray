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

.data 
	prompt1: .asciiz "\nArray elements are: "
	prompt2: .asciiz "\nNew array is: "

.text 

	# print out prompt1 to the user 
	printS(prompt1)
	
	
	##### print out elements of the original array #####
	
	
	##### reverse the elements of the array using stack #####
	
	
	# print out prompt2 to the user 
	printS(prompt2)
	
	# print out the new array elements  