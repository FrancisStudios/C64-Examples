BasicUpstart2(main)

main:
    jsr     $E544                          //; Clear Screen (optional but I like to demonstrate prints this way)
    clc                                    //; Clear the carry flag (so our output won't be affected from
                                           //; operations above ^^
    //; -------------- Using our table -------------- 
    ldx     #1                             //; We load the actual number (#) "0" into X register just like that      
    lda     theTableInQuestion, x          //; basicallly theTableInQuestion[x] in modern programming languagages
                                           //; It works just like an array indexing starts from 0
    //; ------------ Printing the result ------------ 
    adc     #$30                           //; add an offset to our result so it will recognized in the PETSCII tab. 
    jsr     $ffd2                          //; call CHR OUT from the Kernal - you already 
                                           //; know this from the hello world example

    rts                                   //; You already know this... Terminating program safely
    //; -------------- Table comes here -------------- 
    theTableInQuestion: 
                    .byte 1 //; This is gonna be our table (similar declaration to a variable)
                    .byte 2 //; Just more space allocation as you see. We'll have a couple of
                    .byte 3 //; entries over here
                

//; So to sum up. Tables are a bit similar to arrays in modern languages so far. 
//; TRY CHANGING ldx #1 to ldx #0 or ldx #2 to see the bytes in the table offset 
//; 0 and 2
//; I hope this helped you to understand tables in C64 assembly ^^ peace