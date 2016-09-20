		NAME	ROTARY_ENCODERS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       ENCODER.ASM                                      ;
;                             Code for rotary encoder routines                           ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;Description:      This has the code that handles rotation of the rotary encoder on the
;				   80188 MP3 player.
;
;Contents:         InitEncoder - initializes the encoder state variable to the initial
;						encoder state
;                  EncoderHandler - responds to interrupts causted by rotation in the
;						encoder
;
;Input:            Rotary Encoder - This reads from the encoder in initialization, then
;						again each time a rotation drives an interrupt.  It uses these
;						values to determine which direction it was turned.
;
;Output:           None.
;
;Error Handling:   None.
;
;Data Structures:  None.
;
;Revision History: 09/19/16    Tim Menninger   Created
;

CGROUP  GROUP   CODE
DGROUP  GROUP   DATA

CODE    SEGMENT PUBLIC 'CODE'

        ASSUME  CS:CGROUP, DS:DGROUP


$INCLUDE(src\encoder.inc)           ;Constants related to buttons

;
;InitEncoder
;
;Description:       Initializes the state variable that is used to compare to the encoder
;					and decide what direction it is turning.
;
;Operation:         This reads the data from the rotary encoder's debouncer and stores it
;					in a shared state variable.
;
;Arguments:         None.
;
;Return Value:      None.
;
;Local Variables:   None.
;
;Shared Variables:  EncoderState (WRITE) - Sets the EncoderState variable to the initial
;						state of the rotary encoder.
;
;Global Variables:  None.
;
;Input:             Rotary Encoder - This reads from the button debouncer connected to
;						the rotary encoder
;
;Output:            None.
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed: AX, DX
;
;Revision History:  09/19/16   Tim Menninger   Created
;
InitEncoder     PROC        NEAR
                PUBLIC      InitEncoder

ReadInitialState:
	MOV		DX, ENCODER_PORT	;want initial encoder state for future turns
	XOR		AX, AX				;clear high byte because reading only byte
	IN		AL, DX				;read encoder state
	MOV		EncoderState, AL	;store encoder state

InitEncoder		ENDP


;
;EncoderHandler
;
;Description:       This is called in response to interrupts driven by rotation in the
;					rotary encoder.  It uses the previously known state and the new state
;					to decide which way the encoder rotated, then updates the system
;					accordingly.
;
;Operation:         Reads from the debouncer relaying encoder state.  Then stores the
;					previous state and updates the shared variable with the new state.
;					It puts the previous state in the 2nd and 3rd bits of a register and
;					the current state in the 0th and 1st bits of the same register, then
;					uses that number to index a table.  The table is set up such that
;					each index corresponds to exactly one direction (counterclockwise,
;					clockwise, no motion, unable to be determined).  The table contains
;					the offset of the function to run on the given previous/current state
;					combination.
;
;Arguments:         None.
;
;Return Value:      None.
;
;Local Variables:   None.
;
;Shared Variables:  EncoderState (WRITE) - The value in this is read as the previous
;						value, then the value read from the encoder is stored in its
;						place in EncoderState
;
;Global Variables:  None.
;
;Input:             Rotary Encoders - The state is read and the function changes the
;						system setting accordingly.
;
;Output:            None.
;
;Error Handling:    If the previous and current states correspond to either (1) there
;					was no rotation or (2) there were two rotations, then which direction
;					the encoder was turned cannot be determined.  In this case, no action
;					is taken.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed: AX, DX
;
;Revision History:  09/19/16   Tim Menninger   Created
;
EncoderHandler	PROC		NEAR
				PUBLIC		EncoderHandler

	PUSH	DI

ReadEncoderState:
	MOV 	DX, ENCODER_PORT	;need port to read new encoder state
	XOR		AX, AX				;clear high byte because only reading byte
	IN		AL, DX				;read encoder state
	MOV		DI, AX				;make copy to retain next value
	XCHG	EncoderState, AL	;get encoder state to check which direction it moved

DecideEncoderMotion:
	AND		AX, STATE_MASK		;mask out bits that don't relate to last encoder state
	AND		DI, STATE_MASK		;mask out bits that don't relate to current encoder state
	SHL		AX, STATE_BITS		;shift last state so we can combine the two states
	OR		DI, AX				;combine two states to use as table lookup
	JMP		CS:EncoderFunctions[DI];handle function accordingly

HandleClockwise:
	JMP		EncoderHandled

HandleCounterclockwise:
	JMP		EncoderHandled

EncoderHandled:
	POP		DI
	RET

EncoderHandler	ENDP


;
;EncoderFunctions
;
;Description:	This is a table of functions that are called in response to the rotary
;				encoder's direction of rotation.  It is indexed by four-bit integers
;				where b3 and b2 represent the previous state and b1 and b0 represent the
;				next state.
;
;Author:       	Tim Menninger
;Last Changed: 	09/19/16
;
EncoderFunctions LABEL   WORD
				 PUBLIC  EncoderFunctions

;   DW      encoder function offset			;value	direction
	DW      OFFSET(EncoderHandled)			;0000	none
	DW      OFFSET(HandleCounterclockwise)	;0001	counterclockwise
	DW      OFFSET(HandleClockwise)			;0010	clockwise
	DW      OFFSET(EncoderHandled)			;0011	unknown
	DW      OFFSET(HandleClockwise)			;0100	clockwise
	DW      OFFSET(EncoderHandled)			;0101	none
	DW      OFFSET(EncoderHandled)			;0110	unknown
	DW      OFFSET(HandleCounterclockwise)	;0111	counterclockwise
	DW      OFFSET(HandleCounterclockwise)	;1000	counterclockwise
	DW      OFFSET(EncoderHandled)			;1001	unknown
	DW      OFFSET(EncoderHandled)			;1010	none
	DW      OFFSET(HandleClockwise)			;1011	clockwise
	DW      OFFSET(EncoderHandled)			;1100	unknown
	DW      OFFSET(HandleClockwise)			;1101	clockwise
	DW      OFFSET(HandleCounterclockwise)	;1110	counterclockwise
	DW      OFFSET(EncoderHandled)			;1111	none


CODE    ENDS



DATA    SEGMENT PUBLIC  'DATA'

	EncoderState	DB	?  ;Keeps state of encoder so we know rotation direction

DATA	ENDS


        END
