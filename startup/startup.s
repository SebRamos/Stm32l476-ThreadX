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

.section .text.Reset_Handler
.type Reset_Handler, %function

Reset_Handler:
    b .
    