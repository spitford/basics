.data          /* the .data section is dynamically created and its addresses cannot be easily predicted */
var1: .word 3  /* variable 1 in memory */
var2: .word 4  /* variable 2 in memory */

.text          /* start of the text (code) section */
.global _start

_start:
   ldr r0, adr_var1  @ load the memory address of var1 via label adr_var1 into R0
   ldr r1, adr_var2  @ load the memory address of var2 via label adr_var2 into R1
   ldr r2, [r0]      @ load the value (0x03) at memory address found in R0 to register R2
   str r2, [r1, r2]  @ address mode: offset. Store the value found in R2 (0x03) to the memory address found in R1 with the offset R2 (0x03). Base register (R1) unmodified.
   str r2, [r1, r2]! @ address mode: pre-indexed. Store the value found in R2 (0x03) to the memory address found in R1 with the offset R2 (0x03). Base register (R1) modified: R1 = R1+R2.
   ldr r3, [r1], r2  @ address mode: post-indexed. Load the value at memory address found in R1 to register R3. Then modify base register: R1 = R1+R2.
   bx lr 

adr_var1: .word var1 /* address to var1 stored here */
adr_var2: .word var2 /* address to var2 stored here */
