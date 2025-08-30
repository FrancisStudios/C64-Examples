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
                        ldx $1000
                        lda message, x
                        beq exitProgram
                        jsr $ffd2
                        inx
                        stx $1000

    probeForNextGreenLight:
                        jsr timer
                        lda $1001
                        cmp #$01
                        beq messageLoop
                        jmp probeForNextGreenLight
    exitProgram:
                        rts


    timer:
                        jsr $ffe1
                        jsr $ffe4
                        cmp #$0d
                        bne resetTimer
                        lda #$01
                        sta $1001
            timerExit:  rts

    resetTimer:
        lda #$00
        sta $1001
        jmp timerExit



message:                .text "VERY SLOWLY TYPED MESSAGE"
                        .byte 0