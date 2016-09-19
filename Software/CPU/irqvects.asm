    NAME IRQVECTORS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                      IRQVECTS.ASM                                      ;
;                               Initializes Interrupt Vectors                            ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Description:      This code initializes the interrupt vector table.
;
;Contents:         ClrIRQVectors - installs illegal event handler for all interrupt
;                                  vectors that are not reserved
;                  IllegalEventHandler - event handler for uninitialized interrupts
;
;Input:            None.
;
;Output:           The ports relating to the keypads and displays are written
;                  values so we can access them.
;
;User Interface:   None.
;
;Error Handling:   None.
;
;Algorithms:       None.
;
;Data Structures:  None.
;
;Revision History:
;   11/11/92  Glen George		initial revision (originally ISRDEMO.ASM)
;   11/07/14  Tim Menninger		adapted to supplement RoboTrike processes
;   04/21/16  Tim Menninger		adapted to 80188 MP3 player
;



$INCLUDE(intrpts.inc)           ;constants and addresses related to interrupt
                                ;  vectors

CGROUP  GROUP   CODE


CODE    SEGMENT PUBLIC 'CODE'

        ASSUME  CS:CGROUP


;ClrIRQVectors
;
;Description:      This functions installs the IllegalEventHandler for all
;                  interrupt vectors in the interrupt vector table.  Note
;                  that all 256 vectors are initialized so the code must be
;                  located above 400H.  The initialization skips  (does not
;                  initialize vectors) from vectors FIRST_RESERVED_VEC to
;                  LAST_RESERVED_VEC.
;
;Arguments:        None.
;Return Value:     None.
;
;Local Variables:  CX    - vector counter.
;                  ES:SI - pointer to vector table.
;Shared Variables: None.
;Global Variables: None.
;
;Input:            None.
;Output:           None.
;
;Error Handling:   None.
;
;Algorithms:       None.
;Data Structures:  None.
;
;Registers Used:   flags, AX, CX, SI, ES

ClrIRQVectors   PROC    NEAR
                PUBLIC  ClrIRQVectors


InitClrVectorLoop:              ;setup to store the same handler 256 times

        XOR     AX, AX          ;clear ES (interrupt vectors are in segment 0)
        MOV     ES, AX
        MOV     SI, 0           ;initialize SI to skip RESERVED_VECS (4 bytes each)

        MOV     CX, NUM_VECTORS ;up to 256 vectors to initialize


ClrVectorLoop:                  ;loop clearing each vector
                                ;check if should store the vector
        CMP     SI, VECTOR_SIZE * FIRST_RESERVED_VEC
        JB      DoStore         ;if before start of reserved field - store it
        CMP     SI, VECTOR_SIZE * LAST_RESERVED_VEC
        JBE     DoneStore       ;if in the reserved vectors - don't store it
        ;JA     DoStore         ;otherwise past them - so do the store

DoStore:                        ;zero the vector
        MOV     ES: WORD PTR [SI], 0
        MOV     ES: WORD PTR [SI + 2], 0

DoneStore:                      ;done storing the vector
        ADD     SI, VECTOR_SIZE ;update pointer to next vector

        LOOP    ClrVectorLoop   ;loop until have cleared all vectors
        ;JMP    EndClrIRQVectors;and all done


EndClrIRQVectors:               ;all done, return
        RET


ClrIRQVectors   ENDP





CODE ENDS


    END
