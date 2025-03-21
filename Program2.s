@ Author: Sal Bonadonna
@ Course: Comp Org Spring25
@ Date: 3/21/2025


.global main

.data
.balign 4
num1: .word 20
num2: .word 30
num3: .word 36

msg_match:     .asciz "The numbers add up!"
msg_no_match:  .asciz "num1 and num2 are unchanged"

.text

main:
    push {lr}

    @ Load num1
    ldr r1, =num1
    ldr r1, [r1]

    @ Load num2
    ldr r2, =num2
    ldr r2, [r2]

    @ Add r1 + r2 → r4
    add r4, r1, r2

    @ Load num3
    ldr r3, =num3
    ldr r3, [r3]

    @ Compare (num1 + num2) to num3
    cmp r4, r3
    beq if_case     @ If they match, branch to if_case

else_case:
    ldr r0, =msg_no_match
    bl puts
    b end_if

if_case:
    @ Set new values: num1 = 200, num2 = 300, num3 = 360
    mov r5, #200
    ldr r6, =num1
    str r5, [r6]

    mov r5, #300
    ldr r6, =num2
    str r5, [r6]

    mov r5, #360
    ldr r6, =num3
    str r5, [r6]

    ldr r0, =msg_match
    bl puts

end_if:
    pop {lr}
    bx lr



