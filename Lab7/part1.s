.text
.global _start
_start:
mov R1,#-1;
ldr R2,=TEST_NUM;
ldr R0,[R2];
mov R7,#0
mov R8,#0
loop:
cmp R1,R0;
bge END;
add R7,R7,R0;
add R8,R8,#1;
add R2,R2,#4;
ldr R0,[R2];
b loop;
END: B END
.end
