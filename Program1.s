@Author: Sal Bonadonna
@ Course: Comp Org Spring25
@ Date: 3/21/2025

.global main

.data
.balign 4
msg1: .asciz "Are you tired of the humdrum, ordinary life?"
msg2: .asciz "Looking for a life of high adventure??"


.text



main:
    push {lr}           @ Save return address

    mov r1, #18         @ r1 = 18
    mov r2, #18         @ r2 = 18

    cmp r1, r2          @ Compare r1 and r2
    bgt end_if          @ If r1 > r2, jump to end_if

less_than:
    mul r2, r2, r1      @ r2 = r2 * r1
    mov r2, #30         @ r2 = 30

    ldr r0, =msg1       @ Load address of msg1 into r0
    bl puts             @ Print msg1

    ldr r0, =msg2       @ Load address of msg2 into r0
    bl puts             @ Print msg2

end_if:
    pop {lr}            @ Restore return address
    bx lr               @ Return

