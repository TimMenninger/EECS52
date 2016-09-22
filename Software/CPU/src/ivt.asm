		NAME IVT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                         IVT.ASM                                        ;
;                            Initializes Interrupt Vector Table                          ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;Description:      	This code initializes and installs the IVT of interrupt handlers.
;
;Contents:			InstallINTHandlers - installs the interrupt handlers for INT0, INT1
;						INT2, INT3
;					InitIVT - initializes the INT0 interrupt vector
;					IllegalEventHandler - handles INT interrupts that are undefined
;
;Input:            	None.
;
;Output:           	Interrupt control register
;
;User Interface:   	None.
;
;Error Handling:   	None.
;
;Algorithms:       	None.
;
;Data Structures:  	None.
;
;Revision History:
; 	12/11/14	Tim Menninger	Created
;	09/19/16	Tim Menninger	Added code for INT0-INT3, added illegal event handler
;
CGROUP	GROUP	CODE


CODE	SEGMENT PUBLIC 'CODE'

	ASSUME  CS:CGROUP

	EXTRN   ButtonHandler:NEAR
	EXTRN   EncoderHandler:NEAR


$INCLUDE(src\intrpts.inc)        ;contains addresses and constants for interrupt vectors


;InstallINTHandlers
;
;Description:     	This installs the event handlers.
;
;Operation:       	This works by clearing ES and then storing the interrupt vector for
;					the appropriate INT.
;
;Arguments:       	None.
;
;Return Value:    	None.
;
;Local Variables: 	None.
;
;Shared Variables:	None.
;
;Global Variables:	None.
;
;Input:           	None.
;
;Output:          	IVT.
;
;Error Handling:  	None.
;
;Algorithms:      	None.
;
;Data Structures: 	None.
;
;Registers Changed:	flags, AX, ES
;
;Stack Depth:     	0 words
;
;Known Bugs:		None
;
;Limitations:		None
;
;Special Notes:		None
;
InstallINTHandlers  PROC    NEAR
					PUBLIC  InstallINTHandlers

	XOR     AX, AX          ;clear ES (interrupt vectors are in segment 0)
	MOV     ES, AX

InstallINT0:				;store the INT0 vector
	MOV     ES: WORD PTR (4 * INT0_VECTOR), OFFSET(ButtonHandler)        ;function offset
	MOV     ES: WORD PTR (4 * INT0_VECTOR + 2), SEG(ButtonHandler)       ;function segment

InstallINT1:				;store the INT1 vector
	MOV     ES: WORD PTR (4 * INT1_VECTOR), OFFSET(IllegalEventHandler)  ;function offset
	MOV     ES: WORD PTR (4 * INT1_VECTOR + 2), SEG(IllegalEventHandler) ;function segment

InstallINT2:				;store the INT2 vector
	MOV     ES: WORD PTR (4 * INT2_VECTOR), OFFSET(IllegalEventHandler)  ;function offset
	MOV     ES: WORD PTR (4 * INT2_VECTOR + 2), SEG(IllegalEventHandler) ;function segment

InstallINT3:				;store the INT3 vector
	MOV     ES: WORD PTR (4 * INT3_VECTOR), OFFSET(EncoderHandler)       ;function offset
	MOV     ES: WORD PTR (4 * INT3_VECTOR + 2), SEG(EncoderHandler)      ;function segment

	RET                     ;all done, return


InstallINTHandlers  ENDP


;InitIVT
;
;Description:       This function initializes the interrupt vectors.
;
;Operation:         This first sets up the interrupt control register with
;                 	predefined constants and then sends an EOI to clear out the
;					controller. We know that there are exactly 3 interrupt vectors
;					so we do each individually. The process is unwrapped so we don't
;					waste instructions and time comparing an iterator.
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
;Known Bugs:		None
;
;Limitations:		None
;
;Special Notes:	 	None
;
;Revision History:	09/19/16	Tim Menninger	Created
;
InitIVT				PROC    NEAR
			   		PUBLIC  InitIVT

	XOR		CX, CX			;Will be iteration counter

InitINT0Vector:
	MOV     DX, INT0Cntrl	 ;setup the INT0 interrupt control register
	MOV     AX, INT0CtrlrCVal;set up priority
	OUT     DX, AX			 ;write priority to INT0 control register

	MOV     DX, INTCtrlrEOI  ;EOI control register address
	MOV     AX, INT0EOI		 ;INT0 end of interrupt value
	OUT     DX, AX			 ;write end of interrupt

InitINT1Vector:
	MOV     DX, INT1Cntrl	 ;setup the INT1 interrupt control register
	MOV     AX, INT1CtrlrCVal;set up priority
	OUT     DX, AX			 ;write priority to INT1 control register

	MOV     DX, INTCtrlrEOI  ;EOI control register address
	MOV     AX, INT1EOI		 ;INT1 end of interrupt value
	OUT     DX, AX			 ;write end of interrupt

InitINT2Vector:
	MOV     DX, INT2Cntrl	 ;setup the INT2 interrupt control register
	MOV     AX, INT2CtrlrCVal;set up priority
	OUT     DX, AX			 ;write priority to INT2 control register

	MOV     DX, INTCtrlrEOI  ;EOI control register address
	MOV     AX, INT2EOI		 ;INT2 end of interrupt value
	OUT     DX, AX			 ;write end of interrupt

InitINT3Vector:
	MOV     DX, INT3Cntrl	 ;setup the INT3 interrupt control register
	MOV     AX, INT3CtrlrCVal;set up priority
	OUT     DX, AX			 ;write priority to INT3 control register

	MOV     DX, INTCtrlrEOI  ;EOI control register address
	MOV     AX, INT3EOI		 ;INT3 end of interrupt value
	OUT     DX, AX			 ;write end of interrupt

UnmaskINTInterrupts:
    MOV     DX, INT_MASK_REG ;interrupt mask register
    IN      AX, DX           ;get current interrupt value
    AND     AX, UNMASK_INT_MASK;unmask INT0-INT3 in interrupt mask register
    OUT     DX, AX           ;write new interrupt mask value

DoneInit:
    CALL    InstallINTHandlers;install the handler functions for INT0-INT3
	RET                     ;done so return


InitIVT		ENDP


;
;IllegalEventHandler
;
;Description:       This procedure is the event handler for illegal
;                   (uninitialized) interrupts.  It does nothing - it just
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
IllegalEventHandler     PROC    NEAR
                        PUBLIC  IllegalEventHandler

        NOP                             ;do nothing (can set breakpoint here)

        PUSH    AX                      ;save the registers
        PUSH    DX

        MOV     DX, INTCtrlrEOI         ;send a non-sepecific EOI to the
        MOV     AX, NonSpecEOI          ;  interrupt controller to clear out
        OUT     DX, AL                  ;  the interrupt that got us here

        POP     DX                      ;restore the registers
        POP     AX

        IRET                            ;and return


IllegalEventHandler     ENDP

CODE	ENDS

END
