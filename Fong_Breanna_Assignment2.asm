.data

intro: .asciiz "Math in MIPS! by Breanna Fong "

instructions1: .asciiz "Enter two numbers and I will show you the "
instructions2: .asciiz "sum, difference, product, quotient and remainder. "

firstNumber: .asciiz "First number: "
secondNumber: .asciiz "Second number: "

newLine: .asciiz "\n"

plus: .asciiz " + "
subtract:.asciiz " - "
times: .asciiz " x " 
divide: .asciiz " / "
remain: .asciiz " R " 
equal: .asciiz " = " 

sum: .word 8
difference: .word 8
product: .word 8
quotient: .word 8
remainder: .word 8

goodBye: .asciiz "Peace Out Homie."

.text

#prints out introduction 
li   $v0, 4	
la   $a0, intro	
syscall	

#print a new line
li $v0, 4
la $a0, newLine
syscall

#prints out instructions
la   $a0, instructions1	
syscall	

#print a new line
li $v0, 4
la $a0, newLine
syscall

li   $v0, 4
la   $a0, instructions2	
syscall	

#print a new line
li $v0, 4
la $a0, newLine
syscall

#print a new line
li $v0, 4
la $a0, newLine
syscall

# prompt to ask the user's input for the first number
li $v0, 4
la $a0, firstNumber
syscall

#get the user's first number
li $v0, 5
syscall

#store the first number in $t0  
move $t0, $v0 

#print a new line
li $v0, 4
la $a0, newLine
syscall

# prompt to ask the user's input for the second number
li $v0, 4
la $a0, secondNumber
syscall

#get the user's second number
li $v0, 5
syscall

#store the second number in $t1  
move $t1, $v0

#add them up and store the results in t2
add $t2, $t0, $t1	#$t2 = $t0 + $t1
sw $t2, sum

#subtract them and store the results in t3
sub $t3, $t0, $t1	#$t3 = $t0 - $t1
sw $t3, difference

#finding the product of the two numbers and store the results in t4
mul $t4, $t0, $t1	#$t4 = $t0 x $t1
sw $t4, product

#quotient of the two numbers and store the results in t5
div $t5, $t0, $t1	#$t5= $t0 / $t1
mflo $t5
sw $t5, quotient

#remainder of the two numbers after the quotient and store the results in t6
mfhi $t6		# R $t6
sw $t6, remainder

#print a new line
li $v0, 4
la $a0, newLine
syscall

#PRINT OUT SUM EQUATION
#prints first number 
li $v0, 1
move $a0, $t0
syscall

#print out plus symbol
li $v0, 4
la $a0, plus
syscall

#prints second number
li $v0, 1
move $a0, $t1
syscall

#print out equal sign
li $v0, 4
la $a0, equal
syscall

#print out the sum result
li $v0, 1
lw $t3, sum
move $a0, $t3
syscall

#print a new line
li $v0, 4
la $a0, newLine
syscall

#PRINT OUT DIFFERENCE EQUATION
#prints first number 
li $v0, 1
move $a0, $t0
syscall

#print out subtraction sign
li $v0, 4
la $a0, subtract
syscall

#prints second number
li $v0, 1
move $a0, $t1
syscall

#print out equal sign
li $v0, 4
la $a0, equal
syscall

#print out the difference result 
li $v0, 1
lw $t3, difference
move $a0, $t3
syscall

#print a new line
li $v0, 4
la $a0, newLine
syscall

#PRINT OUT PRODUCT EQUATION
#prints first number 
li $v0, 1
move $a0, $t0
syscall

#print out multiplication sign 
li $v0, 4
la $a0, times
syscall

#prints second number
li $v0, 1
move $a0, $t1
syscall

#print out equal sign
li $v0, 4
la $a0, equal
syscall

#print out the product results
li $v0, 1
lw $t4, product
move $a0, $t4
syscall

#print a new line
li $v0, 4
la $a0, newLine
syscall

#PRINT OUT QUOTIENT EQUATION WITH REMAINDER
#prints first number 
li $v0, 1
move $a0, $t0
syscall

#print out division sign
li $v0, 4
la $a0, divide
syscall

#prints second number
li $v0, 1
move $a0, $t1
syscall

#print out equal sign
li $v0, 4
la $a0, equal
syscall

#print out the quotient results
li $v0, 1
lw $t5, quotient
move $a0, $t5
syscall

#print R
li $v0, 4
la $a0, remain
syscall

#prints remainder
li $v0, 1
lw $t6, remainder
move $a0, $t6
syscall

#print a new line
li $v0, 4
la $a0, newLine
syscall

#prints concluding message
li $v0, 4
la $a0, goodBye
syscall

# exit
li $v0, 10
syscall