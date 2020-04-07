//Traffic light controller
// Written in Assembly using GNU assembly syntax 

/*  Traffic light consists of 
    Go - Green Light
    Change signal - Amber
    Stop - Red
    
 */

/* Psuedo c

    create a state machine with a switch case.
    
    state = 0
    
    while(1)

        
    switch (state)
    
    //Red Light
    case 0:
        state = func_0();

    //Amber Light
    case 1:
         state = func_1();

    //Green Light
    case 2:
         state = func_2();

    delay(15)
    
*/ 


    .section .data
        
    state: .word 4 /*Initial starting state of program */

    
    .section .text,"ax"
    //.balign 4
        
    .global asm_src
    .type   asm_src, "function"
    

delay_15_seconds:      
        // 3 instructions in for loop
        // Processor speed e.g. 80MHz
        //f = 1 / p  -- p (seconds)
        // 80 million instructions in 1 second
        //15 seconds = 1 instruction time * 80 million
        //3 instructions in for loop = 400 million loops
        //assuming full pipeline
        
        //switch LED ON
        //LDR r5, =0x
        
        
        //ldr r1, =0x40020018
        //ldr r2, =0x00200000
        //str r2, [r1]
        
        //update link register with approriate value
        //e.g. pc or something so it can return from LED_On properly
        
        //put link register on the stack
        push {lr}
        mov r5, #2
        ldr r1, =0x00000000
        bl LED_On
        
loop:   add r0, #1
        cmp r0, r3
        bne loop
        ldr r0, =0x00000000
        bl LED_Off
        ldr r4, =0xDEADBEEF
        pop {pc}
asm_src: //
    //1. Push link register and frame pointer onto stack  
    //2. 
    
    
    ldr r1, =0xDEADBEEF
    
    //load current state into register r3
    ldr r2, adr_state
    ldr r3, [r2]
    
    BL delay_15_seconds
    
    ldr r2, =0xBEADFEED
adr_state: .word state
