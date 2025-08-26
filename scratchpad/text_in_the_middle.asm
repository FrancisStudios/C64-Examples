//; Text to center example | Press Enter to RTS | C64-Examples @ francisstudios:github
BasicUpstart2(programMain)

programMain:
        jsr $e544                   //; CLR SCREEN kernal routine
        clc                         //; clear carry bit

        ldx #$00                    //; initialize X register at 00

    drawText:                       //; text draw 'sub'

        stx $1000                   //; store x at mem address $1000 hence we use it as a counter and
        ldx X_POSITION              //; for coordinates - this line loads x position which is Y in real life
        ldy Y_POSITION              //; loads Y position (which is X in real life) everything is swapped
        inc Y_POSITION              //; Y variable ++
        jsr $fff0                   //; PUT CURSOR to X_POSITION, Y_POSITION kernal routine
        
        ldx $1000                   //; load back counter from address $1000 to X register
        lda TEXT, x                 //; read text byte at position x (counter)
        beq pause                   //; if text is ready     ->     pause
        jsr $ffd2                   //; if text is not ready ->     CHR OUT kernal routine
        inx                         //; x++

        jmp drawText                //; goto drawText

    pause:                          //; pause 'sub'
        jsr $ffe4                   //; READ KEYB kernal routine
        beq pause                   //; if no entry             ->      goto PAUSE
        cmp #$0d                    //; if [keycode for enter]  ->      <nextLineWillBeIgnored> -> exit
        bne pause                   //; if not equals [enter]   ->      goto PAUSE

    exit:
        rts                         //; return from sub


X_POSITION: .byte 11                //; x-pos variable (could be constant too, but it's nicer since Y has to be var)
Y_POSITION: .byte 8                 //; y-pos variable (secretly X) -> has to be var because it is increased on line
                                    //;                                                                           14
TEXT:
    .text "TEXT TO CENTER EXAMPLE"
    .byte $00