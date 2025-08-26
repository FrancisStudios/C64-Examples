//; Now we have seen addition in the previous example,
//; let's see how the reverse operation of that works.

BasicUpstart2(main)
main:

    lda #5                             //; Load the number 5 into 'A' register
    sec                                //; SEt Carry (instead of CLEAR) - use for subtraction
    sbc #3                             //; SuBtract with Carry 3 - so expected result is 2
    sta $1000                          //; store the result in $1000 just as previously


//; ----- PRINTING THE RESULT -----

    clc
    lda $1000
    adc #$30
    jsr $ffd2

    rts

//; In later examples we will take a look at what Carry is and why Clearing and Setting it is 
//; important but I don't want to confuse everybody now, so let's just stick to simple operations
//; that result in a smaller number than 255 (ideally one digit for now, because our printing fn
//; can not handle more than that)