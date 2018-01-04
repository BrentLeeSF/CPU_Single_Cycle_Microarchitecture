main:
    mov sp, #256 /* assumes RAM of 64 words */
    sub sp, sp, #4
    mov r0, #1
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #2
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #3
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #4
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #5
    str r0, [sp]    /* 16*/

    mov r0, sp
    mov r1, #5
    bl sum_array_a  /*19*/

    
end_main:
    b end_main
    
/* int sum_array_a(int *array, int n); */
sum_array_a:
    mov r2, #0     /* i = 0 */
    mov r3, #0     /* sum = 0 */

loop:
    cmp r2, r1     /* i < n */
    beq done
    ldr r4, [r0]   /* temp = *array */
    add r3, r3, r4 /* sum = sum + temp */
    add r2, r2, #1 /* i++ */
    add r0, r0, #4 /* array = array + 1 */
    b loop

done:
    mov r0, r3     /* return sum */
    bx lr