BasicUpstart2(main)

main:

    jsr $e544
    clc


    ldy #2
    ldx #$00

    textWriteOutSR:

        clc
        cpy #1
        beq printFirstText

        clc
        cpy #2
        beq printSecondText

    resume:
        beq exit
        jsr $ffd2
        inx
        jmp textWriteOutSR


    exit: 
        rts


printFirstText:
    lda text1, x
    jmp resume

printSecondText:
    lda text2, x
    jmp resume


text1: 
    .text "THIS IS TEXT 1 TO DISPLAY"
    .byte 0

text2:
    .text "THIS IS TEXT 2 TO DISPLAY"
    .byte 0