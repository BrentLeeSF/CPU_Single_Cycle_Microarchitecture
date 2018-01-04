main:          /* This is main */
    add r0, r0, #4
    b dude
    add r0, r0, #2
 dude:
 	
    bx lr      /* Return from main */