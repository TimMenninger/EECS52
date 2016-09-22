;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       DISPLAY.INC                                      ;
;                             Constants for display routines                             ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This contains constants for use with the 80188 MP3 player display, found in display.asm
;Revision History:
;	09/20/16	Tim Menninger	Created

;display addresses on board
DISPLAY_PORT				EQU		240H	;port when writing char to display
CMD_DISPLAY_PORT			EQU		241H	;port when using predefined command

;special commands
CLR_DISPLAY_CMD				EQU		01H		;command to clear entire display

;addresses within display
CGRAM_BASE_ADDR				EQU		40H		;command to set addr to CGRAM (data in D5-D0)
DDRAM_BASE_ADDR				EQU		80H		;command to set addr to DDRAM (data in D6-D0)

;general constants
NUM_ROWS					EQU		4		;number of rows in display
ROW_LEN						EQU		20		;number of characters per row
DISPLAY_SIZE				EQU		ROW_LEN * NUM_ROWS ;number of characters in display

PIXEL_HEIGHT				EQU		8		;number of pixels in each character height
PIXEL_WIDTH					EQU		5		;number of pixels in each character width

RF_TRI_IDX					EQU		0		;index of right facing triangle in CGRAM
LF_TRI_IDX					EQU		1		;index of left facing traingle in CGRAM
SQUARE_IDX					EQU		2		;index of square in CGRAM
BARS_IDX					EQU		3		;index of pause bars in CGRAM

BUSY_FLAG_MASK				EQU		80H		;masks everything but busy flag

TITLE_SIZE					EQU		20		;maximum length of title string
ARTIST_SIZE					EQU		20		;maximum length of artist string
STATUS_SIZE					EQU		3		;maximum length of status string
MINUTE_SIZE					EQU		5		;maximum length of minutes string
COLON_IDX					EQU		MINUTE_SIZE	;index of colon in time string
SECOND_SIZE					EQU		2		;length of seconds string
TIME_SIZE					EQU		MINUTE_SIZE+1+SECOND_SIZE	;maximum length of time
