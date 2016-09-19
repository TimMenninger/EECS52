;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       QUEUES.INC                                       ;
;                               Contains the QUEUE struct                                ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;
; Description:		This file contains the struct definition for queues and constants.
;
; Revision History:
;       10/31/14    Tim Menninger   Created
;		12/11/14	Tim Menninger	Combined with que_rout.inc to include all constants
;									for queues.asm
;

;General constants
MAX_QUEUE	EQU		255			;memory in bytes allotted for queue
USE_WORD	EQU		2           ;if queue items are words, we set queue attribute to 2
USE_BYTE	EQU		1           ;if queue items are bytes, we set queue attribute to 1
TL_STRT     EQU     0           ;we initialize tail offset to 0
HD_STRT     EQU     0           ;we initialize head offset to 0

;Queue struct
QUEUE	STRUC
	head		DB	?					;offset from array pointer to head
	tail		DB	?					;offset from array pointer to tail
	sze			DB	?					;1 if each item is a byte and 2 if a word
	item_max	DB	?					;maximum number of items to have in the queue
	q_data		DB	MAX_QUEUE	DUP(?)	;physical data in the queue
QUEUE	ENDS
