# C64 Examples ⌨️

This repository contains a collection of C64 assembly programettes / snippets that demonstrate different behaviors in the C64 architecture. This repository can be a useful resource for learning C64 programming (through Kick Assembler). 

![image](./res/commodore.png)

```
IMPORTANT: this project is for educational purposes. You can compile and run, 
modify and do whatever you like with the example code.

The code can be assembled with Kick Assembler https://theweb.dk/KickAssembler but if you only want to test,
I included the .prg executable files that you can insert into an emulator or write to cassettes, 
floppies or whatever that makes you happy :)
```
## Learning path
1) 💡 [1_border_color](./1_border_color/) - setting the border color is very easy and equally rewarding. You can do something flashy, with a short bit of code to modify the outlook of your target machine. **You can start to understand the process from here.** You can check out the `/all_colors` directory below to learn more.

2) 💡 [2_constants_and_variables](./2_constants_and_variables/) one of the most important parts of any programming language. Simple and easy concept to grasp, and important to master.

3) 💡 [3_basic_arithmetic_registers](./3_basic_arithmetic_registers/) there are 3 registers (there are two + 1 more later)
 in the MOS 6502 CPU 'A' and two index registers 'X' and 'Y' here we learn about them.

4) 💡 [4_tables](./4_tables/) we already checked out variables so talbes are pretty simple to get some grasp on. They can work similarly to arrays in modern programming.

5) 💡 [5_hello_world](./5_hello_world/) the first complex program we write in this tutorial package. 
**This is complex, so don't get discouraged if it is hard at first** then it will be very satisfying when 
you understand how it works. Here, I've explained every step in comments, so hopefully you will get the hang 
of it with a little bit of playing around. I encourage trial and error ways of learning. 

6) 🏁 [FIRST_CHALLENGE](./6_FIRST_CHALLENGE/) we have learned enough, that you can start writing your own simple programs. 
I encourage that you write as many as you can, so you discover all the pitfalls and best practices of the concepts we have learned.
 ![image](./res/challenge-1-solution.png)

7) 💡 [7_basic_math_with_c64](./7_basic_math_with_c64/) we have learned about the 'A' 
register and hint about it's math capabilities so let's check out how it works. 
In this example we learn simple 8 bit addition and subtraction. Division
and multiplication is not built in to the CPU - so if you need something like 
that, you have to program it yourself. That's a great excersize after this
chapter (maybe a little bit too advanced, but if you feel adventureous you can
try a simple multiplier). 

8) 💡 [8_if_else_branching](./8_if_else_branching/) One of the most important aspect of every programming language is to be able to build a control flow
in this chapter we'll learn about the BEQ, BCC, BCS opcodes to be able to create branches on previous comparisons (CPX, CPY)

## Sources
`Here I list some sources you can use for learning`

- [C45 Instructions](https://c64os.com/post/6502instructions)

## Credits

A useful resource from a very nice and smart guy on youtube who explains the concepts
in details. This example list is somewhat following his tutorials. 
I highly suggest his tutorials on the topic:

[▶️ C64 Assembly Programming Course](https://youtube.com/playlist?list=PLU1o_YShTPgoA7_nZ0PutqaPDsitA5RvV&si=jpkUdWcX8eb1PapG)

And also you can check out his channel [Commodore Tutorials](https://www.youtube.com/@board-b-tutorials/featured)