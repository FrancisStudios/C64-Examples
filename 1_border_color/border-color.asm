//; Simplest way to change the border 53280 (or $d020)

BasicUpstart2(main)    //; This generates a small BASIC program [ 10 SYS2062 ]
                       //; you can check out the generated program if you type LIST on your
                       //; C64. This will bootstrap your code from the starting
                       //; memory address and run, so you don't have to invoke it manually.
main:                  //; Start label of your program. You can name it whatever you want
                       //; but make sure to match it in BasicUpstart2();

    lda #5              //; loads the actual number (#) 5 into the accumulator
    sta $d020           //; mov lda, $d020 --> dumps "A" register (accumulator) into $d020 
                        //; memory address - this is where the CPU pulls the color code to the
                        //; border from. The $ stands for hexadecimal numbers!

    rts                 //; program terminates (return from subroutine) - passes back the ball
                        //; to the OS (exits the program)