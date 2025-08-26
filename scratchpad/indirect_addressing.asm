//; https://www.c64-wiki.com/wiki/Indirect-indexed_addressing
//; https://slark.me/c64-downloads/6502-addressing-modes.pdf

BasicUpstart2(main)

.const HI_BIT = $d0     //; I have split $d020 memory address (border color) into
.const LO_BIT = $20     //; Two one byte chunks (so it can be stored in bytes, etc)

main:
    lda #5
    sta (HI_BIT<<8) + LO_BIT    //; Here I bit shift $d0 with 8 bit to get $d000 so
                                //; when I add $20, I will get $d020 and not just 
                                //; $d0 + $20 which is $f0 and store the #5 there
                                //; so we composited a memory address like that ^^
    rts

