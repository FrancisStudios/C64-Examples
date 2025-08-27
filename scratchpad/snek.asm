//; This is a crappy snake game, called SNEK due to the high the quality :)
//; this is included as an example in github.com/francisstudios/C64-Examples
BasicUpstart2(snek)

//; Main routine is running from this point
snek:
                    jsr _clearScreen
                    jsr _moveCursor2Pos
                    lda head
                    jsr $ffd2
                    jsr _requestKeyPress
                    jmp exit




//; Subroutines and labels from this point 
exit:                                           //; labels I sign without underscore (to diff)
                    rts

_moveCursor2Pos:                                //; And subroutine names I sign with an underscore
                    clc                         //; 
                    ldx posY                    //; Pos X and Pos Y are swapped on the commodore screen
                    ldy posX                    //; so I swap it back here so It's more clear for me ^^
                    jsr $fff0                   //; CURSOR TO POS Kernal routine
                    rts                         //; ReTurn from Subroutine -> to main

_clearScreen:                                   //; You should already be familiar with this subroutine
                    jsr $e544                   //; if you're reading this example. We have used it in
                    clc                         //; the main examples before
                    rts

_pauseScreen:
                    jsr $ffe4
                    beq _pauseScreen
                    cmp #$0d                   
                    bne _pauseScreen 
                    rts

_requestKeyPress:
                    jsr $ffe1                   //; CLR KEYB BUFFER subroutine from Kernal

                    jsr $ffe4                   //; GETIN() sub from Kernal -> Accumulator

                    cmp #$57                    //; ASCII code for W
                    beq pressedUp

                    cmp #$41                    //; ASCII code for A
                    beq pressedLeft

                    cmp #$53                    //; ASCII code for S
                    beq pressedDown

                    cmp #$44                    //; ASCII code for D 
                    beq pressedRight   

                    cmp #$51                    //; Q for quit - as it's common in DOS games 
                    beq pressedQuit
                    
                    bne snek
                    jsr $ffe1                   //; Clear keyboard buffer just because I'm OCD
                    rts



//; Direction Key Instructions
pressedUp:
                    dec posY                    //; Y--
                    jmp snek

pressedDown:
                    inc posY                    //; Y++
                    jmp snek

pressedLeft:
                    dec posX                    //; X--
                    jmp snek

pressedRight:
                    inc posX                    //; X++
                    jmp snek

pressedQuit:
                    jmp exit
                                                
                                                

//; Variable pool - have a dive ^^
posX:
                    .byte 19

posY:
                    .byte 11


head:
                    .text "A"
                    .byte 0