//
//  Simplest way to change the border 53280 (or $d020)
//

BasicUpstart2(main)

main:

    lda #5              // loads the actual number (#) 5 into the accumulator
    sta $d020           // mov lda, $d020 --> dumps lda into $d020 memory address.

    rts                 // program terminates