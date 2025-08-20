//; Creating variables and storing colors in them
//; then loading them into border color address

BasicUpstart2(main)
main:
    lda COLOR_GREEN
    sta $d020

    rts

//; All 16 possible colors for C16
//;
//; And you see an example of simple 
//; variable declaration and assignment
//;
//; HEX, BIN, DEC Assignment all valid
COLOR_BLACK:        .byte $00 
COLOR_WHITE:        .byte $01
COLOR_RED:          .byte $02
COLOR_CYAN:         .byte $03
COLOR_PURPLE:       .byte $04
COLOR_GREEN:        .byte $05
COLOR_BLUE:         .byte $06
COLOR_YELLOW:       .byte $07
COLOR_ORANGE:       .byte $08
COLOR_BROWN:        .byte $09
COLOR_PINK:         .byte $0A
COLOR_DARK_GREY:    .byte $0B
COLOR_GREY:         .byte $0C
COLOR_LIGHT_GREEN:  .byte $0D
COLOR_LIGHT_BLUE:   .byte $0E
COLOR_LIGHT_GREY:   .byte $0F