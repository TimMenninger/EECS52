;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       ENCODER.INC                                      ;
;                           Constants for rotary encoder routines                        ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This contains constants for use with rotary encoder routines found in encoder.asm
;Revision History:
;	09/19/16	Tim Menninger	Created

ENCODER_PORT		EQU		80H			;address of rotary encoders
STATE_MASK			EQU		0FFFCH		;masks everything but bits that explain state
STATE_BITS			EQU		2			;number of bits in state
