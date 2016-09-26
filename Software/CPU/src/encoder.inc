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
STATE_MASK			EQU		3H          ;masks everything but bits that explain state
STATE_BITS			EQU		2			;number of bits in state

POT_PORT_UP			EQU		300H		;port for turning up digital potentiometer
POT_PORT_DOWN		EQU		301H		;port for turning down digital potentiometer
BRIGHT_UP			EQU		1			;value to turn display brightness up
BRIGHT_DOWN			EQU		0			;value to turn display brightness down
