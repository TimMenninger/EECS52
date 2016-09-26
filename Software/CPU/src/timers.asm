        NAME TIMERS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       TIMERS.ASM                                       ;
;                                   Initializes Timers                                   ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;Description:       This code initializes and installs the timers.
;
;Contents:          InstallTimerHandlers - installs the timer handlers for Timers 0-2
;                   InitTimer  - initializes the INT0 interrupt vector
;                   IllegalTimerHandler - handles INT interrupts that are undefined
;
;Input:             None.
;
;Output:            Interrupt control register
;
;User Interface:    None.
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Revision History:
;   09/25/16    Tim Menninger   Created
;
CGROUP  GROUP   CODE


CODE    SEGMENT PUBLIC 'CODE'

    ASSUME  CS:CGROUP
    

$INCLUDE(src\intrpts.inc)        ;contains addresses and constants for interrupt vectors


;InstallTimerHandler
;
;Description:       This installs the timer interrupt handlers.
;
;Operation:         This works by clearing ES and then storing the function segment
;                   and offset for timer 0.  Timers 1 and 2 are not in use because
;                   this system uses master mode.
;
;Arguments:         None.
;
;Return Value:      None.
;
;Local Variables:   None.
;
;Shared Variables:  None.
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            IVT.
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed: flags, AX, ES
;
;Stack Depth:       0 words
;
;Known Bugs:        None
;
;Limitations:       None
;
;Special Notes:     None
;
InstallTimerHandler PROC    NEAR
                    PUBLIC  InstallTimerHandler

    XOR     AX, AX          ;clear ES (interrupt vectors are in segment 0)
    MOV     ES, AX

InstallTimer0:              ;store the INT0 vector
    MOV     ES: WORD PTR (4 * Timer0_VECTOR), OFFSET(IllegalTimerHandler)   ;function offset
    MOV     ES: WORD PTR (4 * Timer0_VECTOR + 2), SEG(IllegalTimerHandler)  ;function segment

    RET                     ;all done, return


InstallTimerHandler ENDP


;InitTimer 
;
;Description:       
;
;Operation:         
;
;Arguments:         None.
;
;Return Value:      None.
;
;Local Variables:   None.
;
;Shared Variables:  None.
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            PCB.
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed: AX, DX, ES
;
;Stack Depth:       0 words
;
;Known Bugs:        None
;
;Limitations:       None
;
;Special Notes:     None
;
;Revision History:  09/26/16    Tim Menninger   Created
;
InitTimer           PROC    NEAR
                    PUBLIC  InitTimer 

    MOV     DX, INTCtrlrEOI         ;send a timer EOI signal
    MOV     AX, Timer0EOI           
    OUT     DX, AL                 
    CALL    InstallTimerHandler     ;install the event handler
    
    RET                     ;done so return


InitTimer       ENDP


;
;IllegalTimerHandler
;
;Description:       This procedure is the event handler for illegal
;                   (uninitialized) timer interrupts.  It does nothing - it just
;                   returns after sending a non-specific EOI.
;
;Operation:         Send a non-specific EOI and return.
;
;Arguments:         None.
;
;Return Value:      None.
;
;Local Variables:   None.
;
;Shared Variables:  None.
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            None.
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed: None
;
IllegalTimerHandler     PROC    NEAR
                        PUBLIC  IllegalTimerHandler

        NOP                             ;do nothing (can set breakpoint here)

        PUSH    AX                      ;save the registers
        PUSH    DX

        MOV     DX, INTCtrlrEOI         ;send a non-sepecific EOI to the
        MOV     AX, NonSpecEOI          ;  interrupt controller to clear out
        OUT     DX, AL                  ;  the interrupt that got us here

        POP     DX                      ;restore the registers
        POP     AX

        IRET                            ;and return


IllegalTimerHandler     ENDP

CODE    ENDS

END
