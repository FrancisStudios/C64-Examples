.encoding "petscii_upper" //; to tell KickAssembler that our "hello_world:" directive 
                          //; .text is petscii upper encoded
BasicUpstart2(main)       //; boilerplate code because the first 800 addresses of the 
main:                     //;C64 is reserved, so it will put our program start to 801

    ldx #$00                    //; loads X index register with actual number (#) hex ($) 00 = 0

loop:                           //; label for a loop in which we will write each char onto the scr
    lda hello_world,x           //; loading the first char of our "HELLO WORLD" into the accumulator
    beq terminate               //; if 0 is in the accumulator, it will jump to [terminate] label = no more text
    jsr $ffd2                   //; kernel routine !CHR OUT!
    inx                         //; increment x for the next character in hello world
    jmp loop                    //; jump to [loop] label for continuing from the next character at x index

terminate: rts                  //; program terminate syscall

hello_world: .text "HELLO WORLD" //; petscii only recognises uppercase letters
             .byte 0             //; text termination for '\0' basically


//;                                    PROGRAM EXPLANATION
//; First we choose an encoding, because ASCII (like in our "modern" systems) didn't really 
//; existed in the Commodore 64 world, so we have to explicitely tell our assembler that our
//; HELLO WORLD text should be encoded from ASCII to PETSCII (the commodore encoding)
//;
//; Then we start our program from the label [main]. Where outside of the loop we set ourselves
//; an index into the X register and initialize it into 0 with the actual number $00.
//; It is very similar to initialize our "i" variable in a for loop in C style syntax
//; for(int i = 0; ...; ...) and basicall that is what we are trying to do here. Loop through
//; all letters of our text with a for loop (just for loops don't exist in this version of ASM)
//; 
//; Then we load the x index of hello_world into the accumulator (a) register:
//; char letters[] = {'H', 'e', 'l', 'l', 'o', ' ' , 'w', 'o', 'r', 'l', 'd', '\0'};
//; accumulator = letters[x]
//; 
//; Then we check if the accumulator is 0 with "beq" if it's zero we jump to [terminate] label which 
//; is only followed by one instruction "rts" which terminates the program safely. The accumulator is
//; zero when the text termination ".byte 0" comes it's '\0' in C. 
//; 
//; If the text is not terminated yet - so BEQ is false and we do not jump to [terminate] label
//; we continue with a kernel routine call on $ffd2 which is a CHARACTER OUT call with the data
//; from the ACCUMULATOR register (that's why we put the x index of hello_word into there on
//; this line: lda hello_world,x ) it's basically a printf() from the C standard lib :D 
//; printf(hello_world[x])  where "jsr $ffd2" is the fn call and "lda hello_world,x" is the param
//;
//; Then we increment x register with INX
//; basically i++ or rather x++ in this case :D 
//;
//; Then we jump up to the [loop label to start it again]
//;
//; I HOPE MY EXPLANATION MAKES SENSE AND YOU COULD LEARN THE WORKINGS OF THIS SIMPLE PROGRAM ON
//; STEROIDS. I KNOW ASM NEEDS SOME GETTING USED TO COMPARED TO HIGHER LEVEL LANGS (EVEN C OR C++)
//; THINGS ARE A BIT CLUNKY, YOU RATHER USE REGISTERS THAN DECLARE VARIABLES FOR EVERYTHING - THAT'S
//; THE CASE WITH X HERE.
//;
//; LET ME KNOW IF I MISSED SOMETHING OR IF I MADE A MISTAKE IN MY EXPLANATION. Thank you!
