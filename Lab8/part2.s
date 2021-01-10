.global _start
_start:
ldr r1,=0xff200000
mov r2,#0
mov r3,#0
ldr r4,=50000000
ldr r5,=0xfffec600
str r4,[r5]
mov r4,#0b011
str r4,[r5,#8]
ldr r6,=0xff200050

STATE1: 
ldr r0,=0b1000000001
str r0,[r1]
b NEXT_STATE

STATE2:
ldr r0,=0b0100000010
str r0,[r1]
b NEXT_STATE

STATE3:
ldr r0,=0b0010000100
str r0,[r1]
b NEXT_STATE

STATE4:
ldr r0,=0b0001001000
str r0,[r1]
b NEXT_STATE

STATE5:
ldr r0,=0b0000110000
str r0,[r1]
b NEXT_STATE

NEXT_STATE:
cmp r2,#4
moveq r3,#1
cmp r2,#0
moveq r3,#0
cmp r3,#0
addeq r2,r2,#1
subgt r2,r2,#1
b DELAY

DELAY:
ldr r4,[r5,#0xc]
ldr r7,[r6]
cmp r7,#8
bge TOGGLE
cmp r4,#0
beq DELAY
str r4,[r5,#0xc]
cmp r2,#0
beq STATE1
cmp r2,#1
beq STATE2
cmp r2,#2
beq STATE3
cmp r2,#3
beq STATE4
cmp r2,#4
beq STATE5

TOGGLE:
ldr r4,[r5,#0xc]
ldr r7,[r6]
cmp r7,#8
blt RESET
cmp r4,#0
beq TOGGLE
str r4,[r5,#0xc]
cmp r2,#0
beq STATE1
cmp r2,#1
beq STATE2
cmp r2,#2
beq STATE3
cmp r2,#3
beq STATE4
cmp r2,#4
beq STATE5

RESET:
ldr r7,[r6]
cmp r7,#8
bge RESET_TOGGLE
b RESET

RESET_TOGGLE:
ldr r7,[r6]
cmp r7,#8
blt DELAY
b RESET_TOGGLE

.end