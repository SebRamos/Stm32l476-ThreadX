.syntax unified
.cpu cortex-m4
.thumb

.global Reset_Handler
.balign 4
.global g_pfnVectors
.type g_pfnVectors, %object

.section .isr_vector, "a", %progbits

g_pfnVectors:
    .word _estack
    .word Reset_Handler
    .word Default_Handler       // NMI
    .word Default_Handler       // HardFault
    .word Default_Handler       // MemManage
    .word Default_Handler       // BusFault
    .word Default_Handler       // UsageFault
    .word 0                     // Reserved
    .word 0                     // Reserved
    .word 0                     // Reserved
    .word 0                     // Reserved
    .word Default_Handler       // SVCall
    .word Default_Handler       // Debug Monitor
    .word 0                     // Reserved
    .word Default_Handler       // PendSV
    .word Default_Handler       // SysTick

.size g_pfnVectors, . - g_pfnVectors

.section .text.Default_Handler
.type Default_Handler, %function

Default_Handler:
    b .

.section .text.Reset_Handler
.type Reset_Handler, %function

Reset_Handler:
    ldr  r0, =_sidata   // Flash addr where .data initial values are stored
    ldr  r1, =_sdata    // Beginning of .data in SRAM
    ldr  r2, =_edata    // End of .data in SRAM

copy_data:          
    cmp  r1, r2         // r1 == r2 ? 
    beq  done_copy      // If yes, goto done

    ldr  r3, [r0]       // Rd the 32-bit value from mem addr stored in r0, load into r3
    str  r3, [r1]       // Wr the 32-bit value from r3, store into mem addr in r1

    adds r0, #4         // Increment value in r0 by 4 (32-bits) to get to next addr
    adds r1, #4         // Increment value in r1 by 4 (32-bits) to get to next addr

    b copy_data         // Iterate

done_copy:
    ldr  r1, =_sbss     // Beginning of .bss in SRAM
    ldr  r2, =_ebss     // End of .bss in SRAM
    movs r3, #0         // Store 0 in r3 to zero-initialize

zero_bss:
    cmp r1, r2          // r1 == r2 ?
    beq done_bss        // If yes, goto done

    str r3, [r1]        // Wr (0) into value at address in r1

    adds r1, #4         // Increment value in r1 by 4 (32-bits) to get to next addr

    b zero_bss          // Iterate
done_bss:

    