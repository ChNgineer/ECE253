ONES:
LDR R2, =TEST_NUM// load the data word into R2
ADD R3, R2, #4
LDR R1, [R2]
MOV R5, #0

LOOP: CMP R1,#-1
MOV R0, #0 // R0 will hold the result
BEQ END

LOOP_ONES: CMP R1, #0 // loop until the data contains no more 1’s
BEQ END_LOOP
LSR R2, R1, #1 // perform SHIFT, followed by AND
AND R1, R1, R2
ADD R0, #1 // count the string lengths so far
B LOOP_ONES

END_LOOP: CMP R0,R5
BGT STORE
MOV R2, R3
LDR R1, [R2]
ADD R3, R3, #4
B LOOP

STORE: 
MOV R5,R0
MOV R2, R3
LDR R1, [R2]
ADD R3, R3, #4
B LOOP

END: B END
.end