//; So in the previous example file we've seen how the addres $0400 corresponds 
//; with the first cell of the screen $401 with the second and so on... 
//; There is another register for each 1000 cells for the color data. 
//; Let's see how it works...

BasicUpstart2(main)

main:                                                   //; Now we have to lay it down where the color memory starts    
                                                        //; it starts in $d800 for the first cell and it works just the
                                                        //; same as it does for the screen memory.
    ldx #$00
    next:                                               //; Here we create a loop to go through all the characters to 255
                                                        //; and also loop through the colors. The color codes are the same
                                                        //; as were before (for border and background colors)
        txa                                             //; Mirror X register to A (so the same value will be in both)
        sta $0400, x                                    //; Put 'A' into $0400 + X then when X=1 the address will be $401
        sta $d800, x                                    //; and the same here when X=2 -> address: $d802
        inx                                             //; x++ which will be mirrored to "A" in the next loop cycle
        cpx #$ff                                        //; compare X register to ff or 255
        bne next                                        //; if not equals then jump to the label [next]
    
    rts                                                 //; if equals, then it will procceed here, and return from subroutine



//; And this way we can demo our ability to use every symbol with every color available. From this point, it's only a matter
//; of calculating the offset (the number of the cell) on the screen to start drawing cool things