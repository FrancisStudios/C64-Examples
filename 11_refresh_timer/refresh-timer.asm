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

    probeForNextGreenLight:
                        jsr timer
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
                        lda timerCurrent
                        cmp timerLimit
                        beq resetTimer
                        jsr timerOSC
            timerExit:  rts

    resetTimer:
                        lda #$01
                        sta greenFlag
                        lda #$00
                        sta timerCurrent
                        jmp timerExit

    timerOSC:
                        cmp $d012
                        bne timerOSC
                        inc timerCurrent
                        rts

timerLimit:             .byte $ff
timerCurrent:           .byte 0
greenFlag:              .byte $00
message:                .text "SLOWLY TYPED MESSAGE - PRESS Q TO EXIT"
                        .byte 0