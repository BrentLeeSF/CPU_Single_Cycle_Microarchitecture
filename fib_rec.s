main:
    mov sp, #256

    mov r0, sp
    mov r0, #3
    bl fib_rec_a

done:
    b done

fib_rec_a:

    sub sp, sp, #4
    str lr, [sp]
    sub sp, sp, #4
    str r4, [sp]
    sub sp, sp, #4
    str r5, [sp]
    sub sp, sp, #4

    cmp r0, #2
    blt end

    mov r4, r0
    sub r0, r4, #1
    bl fib_rec_a

    mov r5, r0
    sub r0, r4, #2
    bl fib_rec_a

    add r0, r5, r0

end:

    add sp, sp, #4
    ldr r5, [sp]
    add sp, sp, #4
    ldr r4, [sp]
    add sp, sp, #4
    ldr lr, [sp]
    add sp, sp, #4

    bx lr
            