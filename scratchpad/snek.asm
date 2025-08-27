//; This is a crappy snake game, called SNEK due to the high the quality :)
//; this is included as an example in github.com/francisstudios/C64-Examples
BasicUpstart2(snek)

snek:
                    jsr _clearScreen
                    jsr _moveCursor2Pos
                    lda head
                    jsr $ffd2
                    rts

                                                //; Subroutines and labels from this point
exit:                                           
                    rts

_moveCursor2Pos:
                    clc
                    ldx posY
                    ldy posX
                    jsr $fff0
                    rts

_clearScreen:
                    jsr $e544
                    clc
                    rts

_pauseScreen:
                    jsr $ffe4
                    beq _pauseScreen
                    cmp #$0d                    
                    bne _pauseScreen 
                    rts

                                                //; Variable pool - have a dive ^^
posX:
    .byte 19

posY:
    .byte 11


head:
    .text "A"
    .byte 0