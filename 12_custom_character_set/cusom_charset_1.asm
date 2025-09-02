//; We have already explored the default character-set of the C64 
//; in the first couple examples. https://sta.c64.org/cbm64scr.html
//; We have printed them all in different colors and in monochrome mode too. 
//; But what if I say that we can create custom charactersets to enhance our 
//; applications' graphics.

//; Every character is 8bytes (as you can imagine 8x8px)
//; High resolution characters are represented by the 8x8 pixel format
//; 0 0 0 1 1 0 0 0                 .byte $18 
//; 0 0 1 0 0 1 0 0                 .byte $24
//; 0 1 0 0 0 0 1 0                 .byte $42
//; 0 1 1 1 1 1 1 0                 .byte $7e
//; 0 1 0 0 0 0 1 0                 .byte $42
//; 0 1 0 0 0 0 1 0                 .byte $42
//; 0 1 0 0 0 0 1 0                 .byte $42
//; 0 0 0 0 0 0 0 0                 .byte $00
//; Low resolution (but multi-color) characters are represented in a 
//; 4x8 pixel format - here every two bits represent a color - 3
//; colors are available
//; [ 0 0 ] [ 1 1 ] [ 1 1 ] [ 0 0 ]
//; [ 1 1 ] [ 0 0 ] [ 0 0 ] [ 1 1 ]
//; [ 1 1 ] [ 1 1 ] [ 1 1 ] [ 1 1 ]
//; [ 1 1 ] [ 1 0 ] [ 0 1 ] [ 1 1 ]
//; [ 1 1 ] [ 0 0 ] [ 0 0 ] [ 1 1 ]
//; [ 1 1 ] [ 0 0 ] [ 0 0 ] [ 1 1 ]
//; [ 1 1 ] [ 0 0 ] [ 0 0 ] [ 1 1 ]
//; [ 1 1 ] [ 0 0 ] [ 0 0 ] [ 1 1 ]
//; Where there are two zeroes next to each other in the 8x8 grid
//; it represents the transparent (bkg color) 
//; 1 - 0 = COLOR 1
//; 0 - 1 = COLOR 2
//; as you can guess 

