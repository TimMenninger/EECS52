;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       BUTTONS.INC                                      ;
;                              Constants for button routines                             ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This contains constants for buttons routines found in buttons.asm
;Revision History:
;	04/21/16 	Tim Menninger	Created

;Number of buttons, used for iterating
NUM_BUTTONS     EQU     8                   ;Number of bits in buttons byte

;Address of button port
BUTTON_PORT     EQU     0H					;button port
