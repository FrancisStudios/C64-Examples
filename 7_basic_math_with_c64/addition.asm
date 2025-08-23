//; In this example file we will check out how addition
//; works. We have done this before, just maybe you didn't
//; recognise it yet.

BasicUpstart2(main)
main:

    lda #3                                      //; Let's initialize our accumulator with the actual number 3   A = 3
    clc                                         //; Clear out the Carry bit - this is a space that carries overflows, 
                                                //; CLC clears it so our math operation will be not affected by it.

    adc #2                                      //; ADd with Carry - we will add the actual number 2 to the 3 that is already
                                                //; loaded into the A register, so we expect the result to be 5 innit?

    sta $1000                                   //; Store result (as we expect 5) in a memory address.

    //; ---------- HERE COMES THE PRINTING SO WE WILL SEE WHAT'S THE RESULT ----------

    clc                                         //; Clear the Carry
    lda $1000                                   //; Load the contents of $1000 memory address into 'A' register

    adc #$30                                    //; Add with carry $30 - which will add 48 (30 in hexadecimal) to
                                                //; A register - so the following CHR OUT command will be able to 
                                                //; print it as a PETSCII text (basically this is a simple converter)
    
    jsr $ffd2                                   //; Character out Routine

    rts                                         //; Return from subroutine (exit)


//; Simple math operations can range from 0x00 to 0xff or $00 - $ff (whichever notation you like the most) as it is an
//; 8-bit register. In decimal it is 0 - 255. The C64 is an 8-bit computer that means that the registers can work with
//; 8-bits of data. So the smallest number you can work with is 00000000 and the biggest is 11111111 (I assume you already
//; know how to calculate binary and hexadecimal - if not, it's a good time to learn it now (It's not at all a difficult
//; concept) in Europe it's early middle school math class for some, so just needs a little practice and getting used to and
//; you'll be calculating binary numbers like it's your native tongue ;) Assembly and low-level programming requires this
//; skill. Think of it as picking up a new skill in the process ;) 