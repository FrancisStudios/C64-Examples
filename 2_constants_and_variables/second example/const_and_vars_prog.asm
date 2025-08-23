//; CONST and VAR usage clean
BasicUpstart2(main)
main:

    lda #CONSTANT
    sta $d020
    lda variable
    sta $d021
    rts

    .label CONSTANT = $02
    variable: .byte   $07