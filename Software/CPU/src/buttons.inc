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

;general constants
NUM_BUTTONS     EQU     8                   ;Number of bits in buttons byte
BTN_QUEUE_LEN   EQU     16                  ;Max length of the button queue

;Address of button port
BUTTON_PORT     EQU     0H					;button port

;Key values for each pressed button
KEY_TRACKUP     EQU     0
KEY_TRACKDOWN   EQU     1
KEY_PLAY        EQU     2
KEY_RPTPLAY     EQU     3
KEY_FASTFWD     EQU     4
KEY_REVERSE     EQU     5
KEY_STOP        EQU     6
KEY_ILLEGAL     EQU     7
