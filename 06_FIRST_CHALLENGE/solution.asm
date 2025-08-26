//; This is my solution to the given challenge
//; If there are parts that you didn't understood
//; I commented every single action here so you can
//; have a better understanding ;)

BasicUpstart2(main)

main:

//; ------- 1) Set border color to RED ---------
    lda #COLOR_RED                          //; I have created a constant for the number 2
                                            //; which represents the color RED
    sta $d020                               //; Write it to the memory cell hexadecimal d020
                                            //; where the color of the border is stored the
                                            //; CPU pulls the color from here, you see ^^
//; ---- 2) Set background color to white ------
    lda #COLOR_WHITE
    sta $d021
//; ------ 3) Set text color to orange --------
    lda #COLOR_ORANGE
    sta $0286
//; ---------- 4) Clear the screen ------------
    jsr $e544                               //; clear screen system call
    clc                                     //; clear carry-outs 
//; ------- 1) Write the success text ---------
    ldx #$00                                //; int x = 0; basically :D 
                                            //; or let x = 0; in JS XD
    writeLoop:                              //; Here I created a label to jump to 
        lda challengeTextToWrite, x         //; .text character array indexing basically chars[x]
        beq exit                            //; jump to exit label if 'A' register is 0
        jsr $ffd2                           //; write character that is in 'A' register CHR OUT
        inx                                 //; increment x -> x++
        jmp writeLoop                       //; goto 'writeLoop' label

    exit:                                   //; Here I created a label where 'beq' 
        rts                                 //; Return from subroutine (exit)
//; ------- 1) Set border color to RED ---------

.label COLOR_RED=$02                        //; Here I created constants to store the numbers
.label COLOR_WHITE=$01                      //; under a meaningful name, so I don't have to type
.label COLOR_ORANGE=$08                     //; lda 2 to load the color code for red into 'A' reg.

challengeTextToWrite:                       //; table for text and 0
                    .text "FIRST CHALLENGENGE BEATEN, HURRAY!"
                    .byte 0