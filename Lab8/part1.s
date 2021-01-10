.global _start
.global SWAP
_start:
ldr r7,=LIST
mov r0,r7
mov r5,r0
mov r6,r0
mov r1,#1

RESET:
cmp r1,#0
beq END
mov r1,#0
ldr r4,[r5]
mov r7,r6

REEE:
add r7,r7,#4
sub r4,r4,#1
mov r0,r7
cmp r4,#0
beq RESET
bl SWAP
b REEE

SWAP:
ldr r2,[r0]
ldr r3,[r0,#4]
cmp r2,r3
strgt r3,[r0]
addgt r0,r0,#4
strgt r2,[r0]
movgt r0,#1
addgt r1,r1,#1
movle r0,#0
ENDSUB:
mov pc,lr

END: b END
.end