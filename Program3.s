@ Author: Sal Bonadonna
@ Course: Comp Org Spring25
@ Date: 3/21/2025

@ Description: A demo of how scanf() can be used to read in values from the keyboard 😍
.global main
.func main
.data
.balign 4
x: .word 0
prompt: .asciz "Enter a # between 1-10: "
.balign 4
scanpattern: .asciz "%d" @ the scan pattern, "%d", means we are scanning for an int
.balign 4
message: .asciz "You entered %d\n"
.text
main:
push {lr} @ pushes lr onto stack
ldr r0, =prompt @ r0 <- address of prompt
bl puts @ calls puts(), i.e., puts("Enter a # between 1-10");
@ scanf needs two arguments
@ in r0, it needs a pattern to scan for -- %d means scan for an int
@ in r1 it needs the memory address of where the int should be stored
ldr r0, =scanpattern @ r0 <- address of scanpattern
ldr r1, =x @ r1 <- address of x
bl scanf @ calls scanf (now x contains whatever you entered)
@printf() needs two arguments
@ in r0, it contains the address of a string, including %d
@ in r1, it contains a number that wil substitute for %d
ldr r0, =message @ r0 <- address of message
ldr r1,=x @ r1 <- address of x
ldr r1, [r1] @ r1 <- contents of x
bl printf @ calls printf (prints message and x)
pop {lr} @ restores lr
bx lr
