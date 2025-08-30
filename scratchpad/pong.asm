BasicUpstart2(main)

main:       
                                lda #$00
                                sta $d020
                                sta $d021
                                jsr $e544

    gameLoop:
                                jsr _drawStaticElements
                                jsr $ffe1
                                jsr $ffe4
                                cmp #$51
                                beq terminateProgram
                                jmp gameLoop

                        //; Drawing the static elements like the middle line and the points
    _drawStaticElements:
                                //jsr $e544
                                jsr _drawNet
                                clc
                            
                                rts

                        //; Drawing the middle line of the game field SR here
        _drawNet:
                                ldx #$00
                netDrawLoop:    cpx #25
                                beq exitDrawNet
                                ldy #$13
                                jsr $fff0
                                lda #$a6
                                jsr $ffd2
                                inx
                                jmp netDrawLoop
               
                exitDrawNet:    rts


    terminateProgram:
                                rts

netSideParity:                  .byte $00