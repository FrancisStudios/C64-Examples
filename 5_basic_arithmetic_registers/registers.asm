//; Your basic registers are A (accumulator), X (x-index) and Y (y-index)
//; for the MOS6510 CPU. We will learn about the rest (Stack Pointer,
//; Program Counter and Processor flags later on but here we only need three)

BasicUpstart2(main)

main:
    lda accumulatorA    //; you are already familiar with loading into A register
    sta $1000           //; and storing it into a memory location for example $1000

    ldx indexX          //; you can do the same with X and Y index registers
    stx $2000           //; and store them into a selected memory cell

    ldy indexY          //; load Y
    sty $3000           //; store Y


//; ----- Let's print them the way we learned in the previous example -----
    jsr     $E544                          //; Clear Screen (optional but I like to demonstrate prints this way)
    clc                                    //; Clear Carryouts from previous routine

    lda $1000                              //; Load back stored value from address $1000
    adc #$30                               //; add the right offset to be PETSCII friend
    jsr $ffd2                              //; call CHR OUT - which you might know by
                                           //; heart maybe by now :D 
    
    lda $2000                               //; Load back stored value from address $2000
    adc #$30                                //; convert and print
    jsr $ffd2

    
    lda $3000                               //; Load back stored value from address $3000
    adc #$30                                //; convert and print
    jsr $ffd2

    rts                                     //; Return from Subroutine

//; ----- Variable declarations for readability's sake :D :F -----
accumulatorA: .byte 1
indexX: .byte 2
indexY: .byte 3

//; So in this example we've seen the three basic registers in a very surfacial overview (just loading and storing)
//; In the future we will learn about the Stack Pointer register (which is an index register just like X and Y )
//; And Program Counter and the Status Register 