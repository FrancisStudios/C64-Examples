
                jsr $e544
                clc
                ldx #$00
                ldy #$00

            textLoop:
                jsr _myTimer
                jmp textLoop
                
            
            endProgram:
                rts

            
            fetchNextCharacter:
                lda slowText, x
                beq endProgram
                jsr $ffd2
                inx 
                jmp textLoop


            _myTimer:
                cmp $d012                               //; This is a Raster interrupt changes from 1 - 0 at new passes
                beq addOneToTheTimerCounter             //; we check it when It happens and only fetch next character at 60Hz/50Hz


            addOneToTheTimerCounter:
                lda timerCounter
                cmp timerCounterLimit
                beq resetTimer
                inc timerCounter
                


slowText:
                .text "THIS TEXT IS WRITTEN WITH A 60HZ TIMER"
                .byte 0

timerCounter:   
                .byte $00
timerCounterLimit:
                .byte 10