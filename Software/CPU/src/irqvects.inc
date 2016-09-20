;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                      IRQVECTS.INC                                      ;
;                       Contains constants for setting up IRQ vectors                    ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This file contains constants and addresses for interrupt vectors
;Revision History:
;       11/07/14    Tim Menninger   Created/Adapted from Glen George
;       11/29/14    Tim Menninger   Added header and INT2 constants/addresses

; General Constants
VECTOR_SIZE         EQU     4                   ;size of each vector in bytes
NUM_VECTORS         EQU     256                 ;number of vectors in vector table
FIRST_RESERVED_VEC  EQU     1                   ;reserve vectors 1-3
LAST_RESERVED_VEC   EQU     3


