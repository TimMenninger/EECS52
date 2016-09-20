    NAME MP3MAIN

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                         MP3MAIN                                        ;
;                              Main Loop for 80188 MP3 Jukebox                           ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Description:      This program is the main loop for the 80188 MP3 player.
;
; Input:            None.
;
; Output:           None.
;
; User Interface:   None.
;
; Error Handling:   None.
;
; Algorithms:       None.
;
; Data Structures:  None.
;
; Known Bugs:       None.
;
; Limitations:      None.
;
; Revision History: 04/21/16 - Tim Menninger: Created using wolverine.caltech.edu/eecs52
;											  resources as reference.
;




; setup code and data groups
CGROUP  GROUP   CODE
DGROUP  GROUP   DATA, STACK


; segment register assumptions
        ASSUME  CS:CGROUP, DS:DGROUP, ES:NOTHING, SS:DGROUP



; the data segment - used for static and global variables

DATA    SEGMENT  WORD  PUBLIC  'DATA'

DATA    ENDS




; the stack segment - used for subroutine linkage, argument passing, and
; local variables
STACK   SEGMENT  WORD  STACK  'STACK'

        DB      80 DUP ('Stack   ')             ;320 words

TopOfStack      LABEL   WORD

STACK   ENDS



; the actual startup code - should be executed (jumped to) after reset

CODE    SEGMENT  WORD  PUBLIC  'CODE'


        EXTRN   InitCS:NEAR             ;Initializes chip selects
        EXTRN   InitIRQ:NEAR            ;Initializes IRQ vectors
		EXTRN	InitIVT:NEAR			;Initializes interrupt vector table
		EXTRN	InitButtons:NEAR		;Initializes buttonpress queue
		EXTRN	InitEncoder:NEAR		;Initializes encoder state variable
        EXTRN	main:NEAR				;Main loop provided by Glen


Start:

        MOV     AX, DGROUP              ;initialize the stack pointer
        MOV     SS, AX
        MOV     SP, OFFSET(TopOfStack)

        MOV     AX, DGROUP              ;initialize the data segment
        MOV     DS, AX

        CALL    InitCS                  ;initialize chip selects
        CALL    InitIRQ                 ;initialize IRQ vectors
		CALL	InitIVT					;Initializes interrupt vector table
		CALL	InitButtons				;Initializes buttonpress queue
		CALL	InitEncoder				;Initializes encoder state variable

        CALL    main					;call main loop provided by Glen

        JMP     Start                   ;main does not return, here by error



CODE    ENDS



        END
