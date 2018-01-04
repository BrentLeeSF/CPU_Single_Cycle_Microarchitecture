main:
    mov sp, #128
    add sp, sp, sp
    add sp, sp, sp
    add sp, sp, sp
    mov r0, #7
    bl fib_iter_a

done:
    b done
                
fib_iter_a:
    cmp r0, #0 
    beq end_it_all
    cmp r0 , #1 
    beq end_it_all
    mov r2,#0 
    mov r1, #1 
    mov r3,#0
    mov r4,#1
        
loop:    
    cmp r1, r0 
    beq end
    add r2, r3,r4
    mov r3, r4
    mov r4, r2
    add r1,r1,#1
    b loop
end:
    mov r0,r2
end_it_all:
    bx lr