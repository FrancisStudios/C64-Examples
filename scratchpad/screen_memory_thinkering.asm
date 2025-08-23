BasicUpstart2(main)
main:
    printNextScreenCode:
        txa
        sta $400, x
        inx
        cpx #255
        bne printNextScreenCode

    rts