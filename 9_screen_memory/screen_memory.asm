//; Screen memory starts from $0400 and there are 1000 adresses exactly. 
//; The commodore screen is composed of 40 cols and 25 rows = 1000 cells.
//; The counting starts from top left and renders to the bottom right, so
//; The top cell of the screen is memory $0400, the next one is $0401 and
//; so forth. Every cell is 8x8 pixels where you can draw 'screen codes' 
//; or pixel art. 


//; Let's start with screen codes. You can check https://sta.c64.org/cbm64scr.html
//; for all screen codes but for basic letters you can memorize it quite quickly, 
//; because A = 1, B = 2, C = 3, so if you know the alphabet, it shouldn't be an
//; issue. But there are also box drawing characters, "PETSCII" characters and special
//; symbols that might come useful when you create your program

BasicUpstart2(main)

main:
    lda #1          //; Load the number "1" to the accumulator
    sta $400        //; print it to the first screen cell's memory.
                    //; This will result in an A character printed
                    //; in the first screen cell.
    
    lda #2          //; Load the number "2" to the accumulator
    sta $401        //; And when storing in the second cell's memory space
                    //; we will receive a "B" character in the second
                    //; screen cell.


    rts             //; exit

//; Run and observe this, let's continue in the next file under this directory
//; screen_memory2.asm
