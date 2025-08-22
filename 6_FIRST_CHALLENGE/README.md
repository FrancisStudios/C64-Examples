# FIRST CHALLENGE

Now you have to try all that you've learned so far!

We have seen text and number outputs, border and background colors, variables, contants and tables. Now you can try it out on your own. 

**This challenge is more fun if you figure it out with trial and error - give a try programming from what's in your head. Make mistakes! And of course fix them afterwards** of course if you really exhausted all your options, you can look back to previous examples but if you can figure it out yourself, you are a really smart little fella.

```
Write a program in C64 ASM 
(Assembled with Kick Assembler [suggested])

1) Set the border color to red
2) Set the background color to white
3) Set the text color to orange (address $0286 as we
haven't seen this before - this is a new info unlocked ^^)
4) Clear the screen (JSR $E544)
5) Write "First challenge beaten, hurray!" to the screen
```

You can use this color table as a provided cheat sheet

```assembly
COLOR_BLACK:        .byte $00 
COLOR_WHITE:        .byte $01
COLOR_RED:          .byte $02
COLOR_CYAN:         .byte $03
COLOR_PURPLE:       .byte $04
COLOR_GREEN:        .byte $05
COLOR_BLUE:         .byte $06
COLOR_YELLOW:       .byte $07
COLOR_ORANGE:       .byte $08
COLOR_BROWN:        .byte $09
COLOR_PINK:         .byte $0A
COLOR_DARK_GREY:    .byte $0B
COLOR_GREY:         .byte $0C
COLOR_LIGHT_GREEN:  .byte $0D
COLOR_LIGHT_BLUE:   .byte $0E
COLOR_LIGHT_GREY:   .byte $0F
```