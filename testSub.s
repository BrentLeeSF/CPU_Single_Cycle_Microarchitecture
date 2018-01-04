main:          /* This is main */
    add r0, r0, #4
    add r1, r1, #1
    sub r0, r0, #1 // 3
    sub r0, r0, r1 /* 2 */
 	
    bx lr      /* Return from main */