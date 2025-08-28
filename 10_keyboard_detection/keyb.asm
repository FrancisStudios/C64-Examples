//; In this example we will check out how keyboard detection works
//; we will check for WASD (classic game controller keys) to print
//; out which one is pressed.


BasicUpstart2(main)

    main:
                                jsr $e544                                   //; You should already know this -> CLR SCR
                                clc                                         //; In future examples I will only refer to the new routines from now on
    checkKeyboard: 
                                jsr $ffe1                                   //; Kernal routine call for Clearing Keyboard Buffer
                                                                            //; only needed if there is already something in it that
                                                                            //; might mess things up (not really needed here but good
                                                                            //; to now, so I introduce it here. MEMORIZE IT! ^^ )
                                
                                jsr $ffe4                                   //; Kernal routine for GET_INPUT - reads a pressed key in
                                cmp #$57                                    //; Compare A register (pressed key code against W's ASCII code)
                                beq WisPressed                              //; Branch if equal -> goto W is Pressed label
                                cmp #$41                                    //; Compare A register against ASCII code for A
                                beq AisPressed                              //; if equal -> A is Pressed label
                                cmp #$53                                    //; Compare A register against ASCII code for S
                                beq SisPressed                              //; if equal -> S is Pressed label
                                cmp #$44                                    //; Compare A register against ASCII code for D 
                                beq DisPressed                              //; if equal -> D is Pressed label
                                cmp #$51                                    //; Q for quit - as it's common in DOS games 
                                beq exit                                    //; if equal -> exit from program
                                
                                bne checkKeyboard                           //; if none of the above check keyboard input again

    exit:
                                rts

WisPressed:                     
                                ldy #$17                                    //; CHR CODE for W is stored in Y for the message subroutine
                                jsr _writeText                              //; We call our custom created subroutine _writeText with Y set 
                                jmp checkKeyboard                           //; After our subroutine is done we go back checking keyboard inps

AisPressed:                     
                                ldy #$01
                                jsr _writeText
                                jmp checkKeyboard

SisPressed:                     
                                ldy #$13
                                jsr _writeText
                                jmp checkKeyboard


DisPressed:                     
                                ldy #$04
                                jsr _writeText
                                jmp checkKeyboard



_writeText:                                                                 //; In this chapter, as a bonus conent we learn that we can create our own subs 
                                tay                                         //; transfer A <- Y which is $17 for W, $01 for A and so on (basically a fn param)
                                jsr $ffd2                                   //; write the letter onto the screen
                                ldx #$00                                    //; Counter to 0
    writeGenericMessage:
                                lda genericMessage, X
                                beq exitSubroutineWT
                                jsr $ffd2
                                inx
                                jmp writeGenericMessage
    exitSubroutineWT:
                                rts                                         //; When you create a custom subroutine you have to return to the main subroutine to continue
                                                                            //; the execution right below your jsr (subroutine call)


genericMessage:                                                             //; Message spaced out to fill a full 40 char line -> we will learn a nicer way of doing this
                                .text " KEY IS PRESSED                        " //; in the example for PLOTTING, don't worry it will come soonSSSSSSSSSS
                                .byte 0