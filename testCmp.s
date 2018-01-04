main:          /* This is main */
    add r0, r0 #4
    cmp r0, #4
    addeq r0, r0, #2
 	
    bx lr      /* Return from main */