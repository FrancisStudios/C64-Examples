BasicUpstart2(main)

main:       
                                lda #$00
                                sta $d020
                                sta $d021
                                jsr $e544

    gameLoop:
                                jsr _drawStaticElements
                    getKey:     jsr $ffe1
                                jsr $ffe4
                                cmp #$51
                                beq terminateProgram
                                cmp #$0d
                                beq gameLoop
                                jmp getKey

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
                                jsr _oddOrEvenLine
                                jsr $fff0
                                lda #$a6
                                jsr $ffd2
                                inx
                                jmp netDrawLoop
               
                exitDrawNet:    rts

                _oddOrEvenLine:
                                lda netSideParity
                                cmp #$00
                                beq oddParity
                                ldy #$13          
                                dec netSideParity
                                rts
                    oddParity:  ldy #$14          
                                inc netSideParity
                                rts

    terminateProgram:
                                rts

netSideParity:                  .byte $00