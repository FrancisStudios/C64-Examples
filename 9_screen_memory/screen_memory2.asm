//; So here we continue this example, we have written "A" and "B" to the 
//; first two cells. Let's write out the whole screen code set to the 
//; screen with this simple loop.

BasicUpstart2(main)

main:

    ldx #$00                                            //; Initialize X register with 0

    nextScreenCodeAtNextAddress:                        //; Here we create our label to jump to thus having a loop.    
                                                        //; The name says a lot. We will loop through the screen codes
                                                        //; and always print them into the next cell. Just follow me...

        txa                                             //; Copy the contents of X register to A register A = X assignment 
                                                        //; easy opcode to remember (Transfer X to A)
        sta $400, x                                     //; Store the accumulator into the first cell's memory with X offset
                                                        //; so storing 1 at $401 or storing 2 at $402 basically (just a clever trick)
        inx                                             //; x++;
        cpx #255                                      //; compare x to 255
        bne nextScreenCodeAtNextAddress                 //; Branch if not equals -> jmp to label and start again

    rts

//; If you run this, it will print 255 characters in screen code order to the first 255 cells