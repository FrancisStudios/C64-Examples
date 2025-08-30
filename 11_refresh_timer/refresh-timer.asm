//; There are quite a few ways to create timers in your C64 program
//; starting from SID oscillators, simple arithmetic timers and so
//; but we will take the simplest form here - attached to the screen
//; refresh cycles. 
BasicUpstart2(main)

main:
                        jsr $e544
                        clc
                        ldx #$00
    messageLoop:
                        lda #$00
                        sta greenFlag
                        ldx $1000
                        lda message, x
                        beq checkForQuit
                        jsr $ffd2
                        inx
                        stx $1000

    probeForNextGreenLight:                                     //; We use a green light system here, so IF there is a green light
                        jsr timer                               //; then message loop can proceed with 1 character more
                        lda greenFlag
                        cmp #$01
                        beq messageLoop
                        jmp probeForNextGreenLight

    checkForQuit:       
                        jsr $ffe1
                        jsr $ffe4
                        cmp #$51
                        beq exitProgram
                        lda #$00
                        txa
                        jmp messageLoop
    exitProgram:
                        rts


    timer:
                        lda timerCurrent                            //; We compare current timer value with timer limit (it's the time delay)
                        cmp timerLimit                              //; timer limit is set to max $ff - we have to count 255 refreshes for one
                        beq resetTimer                              //; timer tick
                        jsr timerOSC                        
            timerExit:  rts

    resetTimer:
                        lda #$01                                    //; when we reset the timer, we activate the green flag
                        sta greenFlag                               //; and reset timerCurrent = 0
                        lda #$00
                        sta timerCurrent
                        jmp timerExit

    timerOSC:
                        cmp $d012                                     //; This is the oscillator for our timer $d012 - raster refresh flag
                        bne timerOSC                                  //; if not refreshed then wait until it is 
                        inc timerCurrent                              //; -when refreshed timerCurrent++
                        rts                                           //; return to caller

timerLimit:             .byte $ff
timerCurrent:           .byte 0
greenFlag:              .byte $00
message:                .text "SLOWLY TYPED MESSAGE - PRESS Q TO EXIT"
                        .byte 0