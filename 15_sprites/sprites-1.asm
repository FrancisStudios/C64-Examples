//; In this example we will learn about sprites (and how to display them)
//; The MOS 6502 / 6510 can display 8 Hardware sprites (if more needed you
//; will have to resort to tricks like sprite multiplexing). Sprites are 
//; 24px wide and 21 pixels high in the C64's CPU, and there are two different
//; types of sprites exists:
//; 1) HI-RES SPRITES ( monochromatic only )
//; 2) LOW-RES SPRITES (multichromatic) - but pixels are double wide for color sep.
//; But you can, again can use tricks to make a high resolution color sprite
//; by combining these


//; ---------------- MONOCHROMATIC MODE SPRITES ----------------
BasicUpstart2(main)

main:
    