main:          /* This is main */
    add r0, r0, #4
    bl hey
    addeq r0, r0, #2
hey:
    bx lr      /* Return from main */