main:
    mov sp, #128
    add sp, sp, sp
    add sp, sp, sp
    add sp, sp, sp

    sub sp, sp, #4
    mov r0, #1
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #2
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #5
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #4
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #3
    str r0, [sp]

    mov r0, sp
    bl find_max_a

end_main:
    b end_main

find_max_a:
    mov r1, #5
    mov r2, #0
    ldr r5, [r0]
    add r0, r0, #4
    add r2, r2, #1

loop:
    cmp r2, r1
    beq done

    ldr r4, [r0]
    add r0, r0, #4

    cmp r4, r5
    movgt r5, r4
    add r2, r2, #1

    b loop

done:
    mov r0, r5
    bx lr