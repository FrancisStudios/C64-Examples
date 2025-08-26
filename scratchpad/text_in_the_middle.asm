//; This example puts a COLORED text in the middle of the screen using the 
//; screen text and color memories. Everything is variablized for clean code


BasicUpstart2(main)

main:

    jsr $e544
    clc

    ldx #$00

    drawText:
        lda TEXT_1, x
        beq exit
        sta $0400, x
        inx
        jmp drawText

    exit:
        rts


 .label X_POSITION=10
 .label Y_POSITION=10

TEXT_1: 
    .byte $03, $05, $0E, $14, $05, $12, $05, $04, $20, $14, $05, $18, $14
    .byte $00

 TEXT_2: .text "GITHUB.COM/FRANCISSTUDIOS"
         .byte 0