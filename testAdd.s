main:          /* This is main */
    add r0, r0, #2
    add r1, r1, #1
    add r0, r0, r1
 	
    bx lr      /* Return from main */