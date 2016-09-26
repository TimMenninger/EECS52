        NAME    DISPLAY

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       DISPLAY.ASM                                      ;
;                                 Code for button routines                               ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;
;Description:		This contains methods for writing to the display.
;
;Contents:			InitDisplay - Clears display and mirroring array and calls a function
;						to set special characters in display CGRAM
;					BlockDisplay - Blocks until the display busy flag is clear
;					PlaceCharacter - Places one character on the display
;					PlaceString - Places a string on the display
;					InitSpecialCharacter - Writes a special character to CGRAM
;
;Input:				Display - The busy flag is read from the display to ensure it is
;						ready for data before being sent
;
;Output:           	Display - This writes to the display
;
;Error Handling:   	None.
;
;Data Structures:	None.
;
;Revision History: 	09/20/16    Tim Menninger   Created
;

CGROUP  GROUP   CODE
DGROUP  GROUP   DATA


CODE    SEGMENT PUBLIC 'CODE'

        ASSUME  CS:CGROUP, DS:DGROUP

        EXTRN   Dec2String:NEAR  ;Converts int to decimal representation of string



$INCLUDE(src\display.inc)           ;Constants related to buttons
$INCLUDE(src\converts.inc)          ;Contains length of converted dec string



;
;InitDisplay
;
;Description:		Initializes the display to be blank and stores special characters in
;					the display's onboard CGRAM.
;
;Operation:			This first clears the local copy of what is on the display.  This
;					local copy will be used to save time later by not overwriting a
;					character with the same character.  Next, it sends a command to the
;					display that tells it to clear the display, which happens by writing
;					a space to each character.  After clearing the display, this sets up
;					special characters in CGRAM for future use.  The special characters
;					used are for displaying play, fast forward, rewind, stop and pause.
;
;Arguments:         None.
;
;Return Value:      None.
;
;Local Variables:   BX - used for iteration
;					SI - address of tables containing special character definitions
;
;Shared Variables:	Displaying (WRITE) - Initialized to all spaces/empty display.
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            Display - This writes an empty display and stores special character
;						encoding in its CGRAM
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed:	AX, BX, DX
;
;Revision History:  09/20/16   Tim Menninger   Created
;

InitDisplay     PROC        NEAR
                PUBLIC      InitDisplay

	PUSH	SI
	XOR		BX, BX					;clear BX to be iterator

ClearLocalCopy:
	CMP		BX, DISPLAY_SIZE		;iterate over every character in display
	JZ		ClearDisplay			;after iteration, send clear display command
	MOV		Displaying[BX], ' '		;represent empty spot as a space

ClearDisplay:
	MOV		DX, CMD_DISPLAY_PORT	;set up to clear display
	MOV		AL, CLR_DISPLAY_CMD		;command clears entire display
	CALL	BlockDisplay			;make sure display is not busy
	OUT		DX, AL					;clear display (utilizes CPLD)

SendSpecialCharacters:				;puts special characters in display's CGRAM
    MOV     DL, PIXEL_HEIGHT        ;used as offset scalar, needs to be in reg for MUL
    
	LEA		SI, RightFacingTriangle	;get pixel value table to load into CGRAM
	MOV		AX, RF_TRI_IDX			;get the index of character
	MUL		DL			            ;scale offset according to character size
	MOV		BX, AX					;put offset in BX for argument
	CALL	InitSpecialCharacter	;place the character in CGRAM

	LEA		SI, LeftFacingTriangle	;get pixel value table to load into CGRAM
	MOV		AX, LF_TRI_IDX			;get the index of character
	MUL		DL			            ;scale offset according to character size
	MOV		BX, AX					;put offset in BX for argument
	CALL	InitSpecialCharacter	;place the character in CGRAM

	LEA		SI, Square				;get pixel value table to load into CGRAM
	MOV		AX, SQUARE_IDX			;get the index of character
	MUL		DL			            ;scale offset according to character size
	MOV		BX, AX					;put offset in BX for argument
	CALL	InitSpecialCharacter	;place the character in CGRAM

	LEA		SI, Bars				;get pixel value table to load into CGRAM
	MOV		AX, BARS_IDX			;get the index of character
	MUL		DL			            ;scale offset according to character size
	MOV		BX, AX					;put offset in BX for argument
	CALL	InitSpecialCharacter	;place the character in CGRAM

DoneInitDisplay:
	POP		SI
	RET

InitDisplay      ENDP


;
;BlockDisplay
;
;Description:		This busy waits while the display's busy flag is set.  It returns
;					when it is reset.
;
;Operation:			This reads the busy flag register from the display and masks
;					everything except the flag bit.  If the flag bit is set, implying
;					that the display is busy, it continues looping.  Otherwise, it
;					returns.
;
;Arguments:         None.
;
;Return Value:      None.
;
;Local Variables:   None.
;
;Shared Variables:	None.
;
;Global Variables:  None.
;
;Input:             Display - This reads the busy flag from the display
;
;Output:            None.
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed:	None.
;
;Revision History:  09/20/16   Tim Menninger   Created
;
BlockDisplay	PROC		NEAR
				PUBLIC		BlockDisplay

	RET
    PUSH	AX

WaitForDoneLoop:					;loops until display not busy
    MOV     DX, CMD_DISPLAY_PORT    ;prepare to read from display
	IN		AX, DX                  ;read display register containing busy flag
	TEST	AL, BUSY_FLAG_MASK		;set zero flag if not busy
	JNZ		WaitForDoneLoop			;loop while still waiting for not busy

	POP		AX
	RET

BlockDisplay	ENDP


;
;PlaceCharacter
;
;Description:		Places one character on the display in an argued position.
;
;Operation:			This takes as argument a position on the display to put the argued
;					character.  The position should correspond to a one-dimensional
;					representation of the display characters in row-major form.  The
;					corresponding offset is retrieved from a table.  It then writes the
;					character to that position.
;
;Arguments:         SP+2 - Character to write
;					SP+4 - Location on the display to write character to
;
;Return Value:      None.
;
;Local Variables:   None.
;
;Shared Variables:	Displaying (WRITE) - Writes the new character to the array
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            Display - This writes a character to the display
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed:	AX, DX
;
;Revision History:  09/20/16   Tim Menninger   Created
;
PlaceCharacter	PROC		NEAR
				PUBLIC		PlaceCharacter

	PUSH	BP
	MOV		BP, SP					;store base pointer to get arguments relative to it

SetDDRAMAddress:					;tell display data will be a character to display
	MOV		BX, [BP+6]				;get character location from argument list
    LEA     SI, CharOffsetTable     ;using address/offset because asm86 is being weird
    XOR     AX, AX                  ;clear AX to cast byte to word
    MOV     AL, BYTE PTR [SI+BX]    ;get location offset
	ADD		AX, DDRAM_BASE_ADDR		;combine offset and base address of display DDRAM

	MOV		DX, CMD_DISPLAY_PORT	;address to send command to display
	CALL	BlockDisplay			;wait until display not busy
	OUT		DX, AX					;send DDRAM address

SendCharacter:
	MOV		AX, [BP+4]				;get character from arguments
	MOV		Displaying[BX], AL		;put the new character in the table
	MOV		DX, DISPLAY_PORT		;get address of display to send character
	CALL	BlockDisplay			;block until character successfully sent
	OUT		DX, AX					;send character

CharacterPlaced:
	MOV		SP, BP					;restore stack
	POP		BP						;restore base pointer
	RET

PlaceCharacter	ENDP


;
;PlaceString
;
;Description:		Places a string on the display at the argued position.
;
;Operation:			This takes a null-terminated string and puts it on the display.  It
;					iterates over all of the characters in the string until it reaches
;					a null character, calling PlaceCharacter on each.  If the character
;					in the string is already in the designated spot on the display, as
;					seen from the Displaying array, it skips writing it.  Every time it
;					places a character, it increments the index of the next character.
;					If that character exceeds the number of characters in the display,
;					then printing ceases.
;
;Arguments:         SP+2 - Pointer to null-terminated string
;					SP+4 - Index on display to put first character in string
;
;Return Value:      None.
;
;Local Variables:   DI - Iterates over characters in the string
;					SI - Iterates over indices in the display
;
;Shared Variables:	Displaying (READ) - Initialized to all spaces/empty display.
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            Display (READ) - For each character, this is checked.  If the
;						character matches the corresponding spot in this array, it is
;						not written to the display, because it is already there.
;
;Error Handling:    If the index exceeds the number of characters in the display,
;					writing ceases.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed:	AX, DX
;
;Revision History:  09/20/16   Tim Menninger   Created
;
PlaceString		PROC		NEAR
				PUBLIC		PlaceString

	PUSH	BP						;store base pointer
	MOV		BP, SP					;use new base pointer for arguments

	PUSH	DI						;store callee-saved registers
	PUSH	SI
	MOV		DI, [BP+4]				;get pointer to string
	MOV		SI, [BP+6]				;get location of first character

PutCharacter:
	CMP		SI, DISPLAY_SIZE		;don't want to go out of bounds
	JZ		StringPlaced			;cease if out of bounds

	MOV		DX, [DI]				;put next character in register for comparison
	CMP		DX, 0					;when null reached, string is done
	JZ		StringPlaced			;done when null reached


    XOR     AX, AX                  ;clear high byte before writing low byte
	MOV		AL, Displaying[SI]		;get character currently on display
	CMP		AX, DX					;check whether next character is already there
	JZ		PutCharacter			;skip character if already there

	PUSH	SI						;character location is second argument
	PUSH	DX						;character itself is first argument
	CALL	PlaceCharacter			;put the character on the display
	SUB		SP, 4					;restore stack pointer after pushing arguments

	INC		DI						;get address of next character
	INC		SI						;move character location to next spot

StringPlaced:
	POP		DI						;restore callee-saved registers
	POP		SI
	MOV		SP, BP					;restore stack
	POP		BP						;restore base pointer
	RET

PlaceString		ENDP


;
;InitSpecialCharacter
;
;Description:		Places a special character defined by the programmer into the
;					display's CGRAM.
;
;Operation:			This first sets the CGRAM address that will be written to.  It
;					determines this address from the argued offset in BX.  It then
;					iterates for each row of pixels in the character and sends a byte
;					of pixel values.  These pixel values are obtained from a table that
;					is assumed to be of appropriate size.  The address of this table is
;					argued in SI.
;
;Arguments:         SI - Pointer to table containing pixel on/off values for special
;						character
;					BX - Offset in CGRAM to place first byte of special character
;
;Return Value:      None.
;
;Local Variables:  	CX - iteration variable
;					AX - Alternates between CGRAM address and pixel row value
;
;Shared Variables:	None.
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            Display - This writes the special character definition to CGRAM
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed:	AX, DX
;
;Revision History:  09/20/16   Tim Menninger   Created
;
InitSpecialCharacter	PROC	NEAR
						PUBLIC	InitSpecialCharacter

SetCGRAMBaseAddress:
	MOV		DX, CMD_DISPLAY_PORT	;display port being written to
	MOV		AX, CGRAM_BASE_ADDR		;get address within display for CGRAM
	ADD		AX, BX					;add in offset to CGRAM address
	MOV		CX, PIXEL_HEIGHT-1		;want to iterate for each row in the character

DrawGlyph:
	CALL	BlockDisplay			;block until display ready
	OUT		DX, AL					;send CGRAM address

	INC		AX						;increase address offset
	PUSH	AX						;save address while we send another command
	MOV		AX, [SI]				;retrieve pixel values
	INC		SI						;increment pointer in table
	CALL	BlockDisplay			;block until display ready
	OUT		DX, AL					;send next line of pixels
	POP		AX						;restore CGRAM address

	LOOP	DrawGlyph

DoneSpecialChar:
	RET

InitSpecialCharacter	ENDP




display_time	PROC		NEAR
				PUBLIC		display_time

	PUSH	BP
	MOV		BP, SP					;store original stack pointer

	PUSH	SI						;save callee-saved register
	LEA		SI, Song				;get address of buffer to fill it

RemoveTenthOfSecond:
	MOV		AX, 10					;remove tenths from time
	MOV		BX, [BP+4]				;get time in seconds to nearest tenth
	XOR		DX, DX					;clear DX in prep for dividing
	DIV		BX						;AX now contains time to nearest second

GetMinsAndSecs:
	MOV		AX, 60					;dividing by 60 will separate mins and secs to AX/DX
	MOV		BX, AX					;move the time out of AX so we can divide again
	XOR		DX, DX					;clear DX in prep for dividing
	DIV		BX						;AX contains mins, DX contains secs

BuildTimeString:
	PUSH	AX						;store so we can do seconds first
	MOV		DX, AX					;doing seconds first because it will overwrite minutes
									;	otherwise
	ADD		SI, TIME_SIZE-DEC2STR_CHARS;where to start the seconds string
	CALL	Dec2String				;load seconds string into time buffer

	SUB		SI, TIME_SIZE-DEC2STR_CHARS;move SI back to beginning of buffer
	MOV		BYTE PTR [SI+COLON_IDX], ':';put colon into time buffer

	POP		AX						;restore minutes value
	CALL	Dec2String				;place minutes string into time buffer

	XOR		BX, BX					;iterator to remove leading zeroes

RemoveLeadingZeroes:
	CMP		BX, MINUTE_SIZE-1		;don't want to remove last zero if minutes were zero
	JZ		DoneTimeString

	CMP		BYTE PTR [SI+BX], '0'   ;if leading zero, replace with space
	JNZ		DoneTimeString			;if not a zero, no more leading zeroes

	MOV		BYTE PTR [SI+BX], ' '   ;clear the buffer character
	INC		BX
	JMP		RemoveLeadingZeroes

DoneTimeString:
	POP		SI						;callee-saved register restored
	MOV		SP, BP					;restore stack
	POP		BP
	RET

display_time	ENDP



display_status	PROC		NEAR
				PUBLIC		display_status

	RET

display_status	ENDP



display_title	PROC		NEAR
				PUBLIC		display_title

	RET

display_title	ENDP



display_artist	PROC		NEAR
				PUBLIC		display_artist

	RET

display_artist	ENDP


;
;CharOffsetTable
;
;Description:  This is indexed by location in the display and contains the address
;			   offsets for said location.
;
;Author:       Tim Menninger
;Last Changed: 05/14/16
;
CharOffsetTable	LABEL   BYTE
                PUBLIC  CharOffsetTable

;   DB      Offset      	;(Row, Col)
	DB		00H				;( 0,    0)
	DB		01H				;( 0,    1)
	DB		02H				;( 0,    2)
	DB		03H				;( 0,    3)
	DB		04H				;( 0,    4)
	DB		05H				;( 0,    5)
	DB		06H				;( 0,    6)
	DB		07H				;( 0,    7)
	DB		08H				;( 0,    8)
	DB		09H				;( 0,    9)
	DB		0AH				;( 0,   10)
	DB		0BH				;( 0,   11)
	DB		0CH				;( 0,   12)
	DB		0DH				;( 0,   13)
	DB		0EH				;( 0,   14)
	DB		0FH				;( 0,   15)
	DB		10H				;( 0,   16)
	DB		11H				;( 0,   17)
	DB		12H				;( 0,   18)
	DB		13H				;( 0,   19)
	DB		40H				;( 1,    0)
	DB		41H				;( 1,    1)
	DB		42H				;( 1,    2)
	DB		43H				;( 1,    3)
	DB		44H				;( 1,    4)
	DB		45H				;( 1,    5)
	DB		46H				;( 1,    6)
	DB		47H				;( 1,    7)
	DB		48H				;( 1,    8)
	DB		49H				;( 1,    9)
	DB		4AH				;( 1,   10)
	DB		4AH				;( 1,   11)
	DB		4BH				;( 1,   12)
	DB		4CH				;( 1,   13)
	DB		4DH				;( 1,   14)
	DB		4EH				;( 1,   15)
	DB		4FH				;( 1,   16)
	DB		50H				;( 1,   17)
	DB		51H				;( 1,   18)
	DB		52H				;( 1,   19)
	DB		14H				;( 2,    0)
	DB		15H				;( 2,    1)
	DB		16H				;( 2,    2)
	DB		17H				;( 2,    3)
	DB		18H				;( 2,    4)
	DB		19H				;( 2,    5)
	DB		1AH				;( 2,    6)
	DB		1BH				;( 2,    7)
	DB		1CH				;( 2,    8)
	DB		1DH				;( 2,    9)
	DB		1EH				;( 2,   10)
	DB		1FH				;( 2,   11)
	DB		20H				;( 2,   12)
	DB		21H				;( 2,   13)
	DB		22H				;( 2,   14)
	DB		23H				;( 2,   15)
	DB		24H				;( 2,   16)
	DB		25H				;( 2,   17)
	DB		26H				;( 2,   18)
	DB		27H				;( 2,   19)
	DB		54H				;( 3,    0)
	DB		55H				;( 3,    1)
	DB		56H				;( 3,    2)
	DB		57H				;( 3,    3)
	DB		58H				;( 3,    4)
	DB		59H				;( 3,    5)
	DB		5AH				;( 3,    6)
	DB		5BH				;( 3,    7)
	DB		5CH				;( 3,    8)
	DB		5DH				;( 3,    9)
	DB		5EH				;( 3,   10)
	DB		5FH				;( 3,   11)
	DB		60H				;( 3,   12)
	DB		61H				;( 3,   13)
	DB		62H				;( 3,   14)
	DB		63H				;( 3,   15)
	DB		64H				;( 3,   16)
	DB		65H				;( 3,   17)
	DB		66H				;( 3,   18)
	DB		67H				;( 3,   19)


;
;RightFacingTriangle
;
;Description:  Row pixel values for a right-facing triangle on the LCD.  This will be
;			   used for play and fast-forward symbols
;
;Author:       Tim Menninger
;Last Changed: 09/20/16
;
RightFacingTriangle	LABEL	BYTE
					PUBLIC	RightFacingTriangle
;	DB		value
	DB		00000B
	DB		01000B
	DB		01100B
	DB		01110B
	DB		01111B
	DB		01110B
	DB		01100B
	DB		01000B


;
;LeftFacingTriangle
;
;Description:  Row pixel values for a left-facing triangle on the LCD.  This will be
;			   used for rewind symbol
;
;Author:       Tim Menninger
;Last Changed: 09/20/16
;
LeftFacingTriangle	LABEL	BYTE
					PUBLIC	LeftFacingTriangle

;	DB		value
	DB		00000B
	DB		00001B
	DB		00011B
	DB		00111B
	DB		01111B
	DB		00111B
	DB		00011B
	DB		00001B


;
;Square
;
;Description:  Row pixel values for a square on the LCD.  This will be the stop symbol
;
;Author:       Tim Menninger
;Last Changed: 09/20/16
;
Square				LABEL	BYTE
					PUBLIC	Square

;	DB		value
	DB		00000B
	DB		00000B
	DB		11111B
	DB		11111B
	DB		11111B
	DB		11111B
	DB		11111B
	DB		00000B


;
;Bars
;
;Description:  Row pixel values for two vertical parallel bars.  This symbol is for pause.
;
;Author:       Tim Menninger
;Last Changed: 09/20/16
;
Bars				LABEL	BYTE
					PUBLIC	Bars

;	DB		value
	DB		00000B
	DB		00000B
	DB		11011B
	DB		11011B
	DB		11011B
	DB		11011B
	DB		11011B
	DB		00000B


CODE    ENDS





DATA    SEGMENT PUBLIC  'DATA'

    Displaying	DB	DISPLAY_SIZE	DUP(?) 	;array of characters being displayed
	Song		DB	TITLE_SIZE		DUP(?)	;buffer for writing song title
	Artist		DB	ARTIST_SIZE		DUP(?)	;buffer for writing artist
	Time		DB	TIME_SIZE		DUP(?)	;buffer for writing time
	Status		DB	STATUS_SIZE		DUP(?)	;buffer for displaying status

DATA    ENDS



        END
