//; ---------------- MULTICHROMATIC MODE SPRITES ----------------
BasicUpstart2(main)

main:




//; So I mentioned in the previous example, that color sprites are low resolution
//; and only offer double-wide pixels. Why is that? 
//; That is because you separate the colors with the combination of pixel data
//; 0-0 : TRANSPARENT
//; 0-1 : COLOR 1
//; 1-0 : COLOR 2
//; 1-1 : COLOR 3
//; 00000000|00000000|000000000
//; 00000000|00000000|000000000
//; 00000000|11111111|000000000
//; 00111111|00000000|111111100
//; 11110000|00000000|000001111
//; 11110100|00000000|001001111
//; 11110000|00000000|000001111
//; 11110000|00000000|000001111
//; 01110000|00000000|000111100
//; 00011111|00000000|111111000
//; 00000000|11111111|000000000
//; 00000000|00000000|000000000
//; 00000000|00000000|000000000
//; 00000000|00000000|000000000
//; 00000000|00000000|000000000
//; 00000000|00000000|000000000
//; 00000000|00000000|000000000
//; 00000000|00000000|000000000
//; 00000000|00000000|000000000
//; 00000000|00000000|000000000
//; In this example above you have to observe everything
//; so you start creating pairs from the first byte of 
//; the line and when there are two 1-s next to each other
//; you have the base color. If you have two 0-s, that's 
//; transparency. And if you have either 01 or 10 that's
//; the other two colors !WHICH ARE SHARED BETWEEN ALL THE
//; SPRITES ON THE SCREEN! the main color 1-1 is unique to
//; each sprite