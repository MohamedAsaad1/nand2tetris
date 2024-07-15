// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(RESTART)
@SCREEN
D=A
@R0
M=D	


(KBDCHECK)

@KBD
D=M
@BLACK
D;JGT	
@WHITE
D;JEQ	

@KBDCHECK
0;JMP

(BLACK)
@R1
M=-1	
@CHANGE
0;JMP

(WHITE)
@R1
M=0	
@CHANGE
0;JMP

(CHANGE)
@R1	
D=M	

@R0
A=M	
M=D	

@R0
D=M+1	
@KBD
D=A-D	

@R0
M=M+1	
A=M

@CHANGE
D;JGT	

@RESTART
0;JMP