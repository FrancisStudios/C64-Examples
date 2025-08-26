//; Branching is one of the most fundamental concepts of programming
//; I assume that you already have some kind of programming experience
//; so maybe you know how important that piece of binary logic is.
//; Well in assembly it's not as simple as you see in modern programming:
//; if(condition){ ...true branch } false branch - pattern. But it's not 
//; the most difficult thing in the world either. In ways it might be
//; quite a bit similar

//; Let's write this simple program together:
//;
//; If OUR_FAVOURITE_NUMBER is bigger than 10 (that we're storing in X register)
//; then the background color should be RED
//; IF OUR_FAVOURITE_NUMBER equals 10 then the color should be YELLOW
//; IF OUR_FAVOURITE_NUMBER is smaller than 10 then the background shines GREEN
//; the instructions should be printed onto the screen 
//;
//; Let's see if you can do that alone, and compare it to this afterwards :) 
//; You can use the branching to see the new mnemonics :) 

BasicUpstart2(main)
main:

    ldx #OUR_FAVOURITE_NUMBER                           //; Load our selected number into X register

    //; --------- 1 HERE IS THE BRANCHING ---------
    cpx #10                                             //; ComPare X to the number 10 - basically X ?> 10
    beq isEqual                                         //; Branch if EQual - if the comparison is equal then jump to isEqual label
    bcc ifSmaller                                       //; Branch if Carry is Clear - meaning if comparison is smaller (jump to ifSmaller label)
    bcs ifBigger                                        //; Branch if Carry is Set - meaning the comparison is bigger (jump to ifBigger label)  

    //; --------- 3 SETTING BORDER COLOR ---------
    setColor:
        sta $d020                                       //; Store the number we've put into 'A' register into the memory space for border color
                                                        //; that's why we filled up 'A' in the ifSmaller, ifBigger, ifEqual labels area 
    //; --------- 4 PRINTING THE RESULT ---------
    jsr     $e544                                       //; Invoking sub routine for clear screen
    clc                                                 //; Clear the Carry after, it might be filled up when using the sub routine above
    ldx #0                                              //; Initializing X with 0   - int X = 0
    
    printText:                                          //; Print text label, so we can jump back to this in the print loop
        lda message, x
        beq exit
        inx
        jsr $ffd2
        jmp printText

    exit:
        rts


     //; --------- 2 SIZE COMPARISON LABELS ---------
    ifSmaller:
        clc                                         //; Clear the Carry because we were relying on it with bcc and bcs so better clean it up
        lda #$05                                    //; Load the number five (color code for green) into 'A' register
        jmp setColor                                //; jump to setColor label
    ifBigger:
        clc
        lda #$02                                    //; If X is bigger than 10 I want to see the color RED
        jmp setColor
    isEqual:
        clc
        lda #$07                                    //; If X == 10 I want to see the color YELLOW indicating it
        jmp setColor

    //; Here we store our variables, for example the message and
    //; of course our number that we compare 10 against
    
    message:
        .text "BIGGER = R"
        .text " | "
        .text "SM = G"
        .text " | "
        .text "EQUALS = Y"
        .byte 0

    .label OUR_FAVOURITE_NUMBER=12