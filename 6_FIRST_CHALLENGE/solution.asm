//; This is my solution to the given challenge
//; If there are parts that you didn't understood
//; I commented every single action here so you can
//; have a better understanding ;)

BasicUpstart2(main)

main:

//; ------- 1) Set border color to RED ---------
    lda #COLOR_RED  //; I have created a constant for the number 2
                    //; which represents the color RED
    sta $d020       //; Write it to the memory cell hexadecimal d020
                    //; where the color of the border is stored the
                    //; CPU pulls the color from here, you see ^^
//; ---- 2) Set background color to white ------
    lda #COLOR_WHITE
    sta $d021
//; ------ 3) Set text color to orange --------
    lda #COLOR_ORANGE
    sta $0286
//; ---------- 4) Clear the screen ------------
    jsr $e544       //; clear screen system call
    clc             //; clear carry-outs 
//; ------- 1) Write the success text ---------
    ldx #$00

    writeLoop:
        lda challengeTextToWrite, x
        beq exit
        jsr $ffd2
        inx
        jmp writeLoop

    exit:
        rts
//; ------- 1) Set border color to RED ---------

.label COLOR_RED=$02
.label COLOR_WHITE=$01
.label COLOR_ORANGE=$08

challengeTextToWrite: 
                    .text "FIRST CHALLENGENGE BEATEN, HURRAY!"
                    .byte 0