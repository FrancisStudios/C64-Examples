//; We will see the difference between constants and variables
//; regarding the syntax and some plus information

BasicUpstart2(main)
main:

//; ===== [ Difference in usage ] =====
    lda myVariable              //; Variables can not be loaded as actual numbers
    lda #THIS_IS_A_CONSTANT     //; Constants should be loaded as actual numbers (#)
                                //; because it represents an actual number nothing more
                                //; just an alias

//; Now let's set our constant to be the C64 border
//; and the variable to be the C64 background color
    lda #THIS_IS_A_CONSTANT
    sta $d020
    lda myVariable
    sta $d021
//; Terminating program properly
    rts

//; ===== [ Difference in declaration ] =====
//; Constants look like this
    .label THIS_IS_A_CONSTANT = $02 

//; Variables as we've seen before
//; with label syntax
    myVariable: .byte $07

//; Variables and Constants should be declared 
//; at the bottom to avoid issues. We need to have
//; proper instructions before declarations in this
//; version of ASM

//; CONSTS are not mutable (can not reassign, change etc)
//; just like as you would expect from any normal programming
//; language... Looking at you JavaScript!! :p  They are just
//; an alias for a byte worth of data (a byte worth of numbers)