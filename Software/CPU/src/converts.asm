        NAME    CONVERTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                        CONVERTS                                        ;
;                                  Conversion Functions                                  ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Description:		This file contains the procedures that take numbers and turn them into
;					ASCII strings.
;
; Contents:			Dec2String - takes a 16 bit signed number and returns an ASCII string
;						representation including '+' or '-' to indicate sign
;					Hex2String - takes a 16 bit unsigned number and returns an ASCII
;						string representation
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
; Revision History:
;	 10/16/14  Tim Menninger	created
;	 12/11/14  Tim Menninger	updated comments
;



CGROUP  GROUP   CODE


CODE	SEGMENT PUBLIC 'CODE'


        ASSUME  CS:CGROUP


$INCLUDE (CONVERTS.INC)					;constants related to Dec2String and Hex2String



;Dec2String
;
;Description:           This returns a string representation of the argued unsigned int
;						in decimal.  The string will be placed at the argued address and
;						will not be null-terminated.
;
;Operation:             This will take the 16-bit number that is to be unsigned and
;						one number at a time, it will divide by a power of 10 (starting
;						with 10^5 and decreasing for each iteration).  That will tell the
;						system what digit goes in the leftmost unused index of the array
;						by adding the digit to '0'.  This works because '0' through '9'
;						in ASCII are each separated by 1.  This function will then call
;						another function that will return the binary representation of the
;						specified digit.  After the power of 10 is 10^0, the string will
;						have been filled in.
;
;Arguments:             AX - 16-bit signed value to turn into a string of digits
;                       SI - location in memory at which the string is to begin
;
;Return Values:         SI - contains string
;
;Global Variables:      None.
;
;Shared Variables:      None.
;
;Local Variables:       pwr10 - this starts at 10000 and is divided by 10 for each
;						iteration.  It is used to look at each digit individually in the
;						decimal representation.
;
;Inputs:                None.
;
;Outputs:               None.
;
;Registers Changed:		AX, BX, CX, DX
;
;Error Handling:        Dividing by pwr10 should always give us a number between 0 and 9.
;						If at some point this is not the case, an error is raised.
;
;Algorithms:            None.
;
;Data Structures:       array - used to store the string
;
;Limitations:           This can only convert numbers up to and including 16-bit signed
;						integers and does not recognize any number outside the range of
;						0 to 65535.
;
;Known Bugs:            None.
;
;Special Notes:         None.
;
; Author:				Tim Menninger
; Revision HIstory:		10/27/14	Tim Menninger	Created
;						12/10/14	Tim Menninger	Improved documentation
;						09/21/16	Tim Menninger	Removed sign character from result and
;													no longer null-terminated



Dec2String      PROC        NEAR
                PUBLIC      Dec2String

	PUSH SI

MakeDecString:					;initialization
	MOV	BX, AX					;store argument into BX
	MOV	CX, PWR10				;pwr10 starts at 10^4 (for 10000's digit)
	CLC							;no error yet
	;JMP MainDecLoop			;check sign of input

MainDecLoop:					;calculate the leftmost decimal digit
	CMP	CX, 1					;only want the loop running until after pwr10 = 1
	JB	EndDecString			;done looping, end the string with NUL
	;JAE FindDigit				;figure out next digit to write

FindDigit:						;proc. to find the next digit
	MOV AX, BX					;prepare for dividing n / pwr10 (need AX to reflect n)
	XOR DX, DX					;prepare for dividing n / pwr10
	DIV	CX						;digit <-- n/pwr10 (AX <-- AX / CX)
								;	 n <-- n MOD pwr10(DX <-- AX mod CX)
	CMP	AX, 10					;(AX <-- digit) to make sure quotient is < 10
	JAE	TooBigDecError			;if >= 10, raise an error
	;JB	WriteToString			;want to write number to array

WriteToString:					;write our found digit to array
	ADD AX, '0'					;make n (AX) an ASCII character
	MOV BYTE PTR [SI], AL		;load our ASCII character into our array
	INC	SI						;increment array index pointer
	JMP ChangeValues			;change values to prepare for next loop iteration

ChangeValues:					;proc. to prepare for iteration
	MOV	BX, DX					;now working with n <-- n MOD pwr10 (BX <-- DX)
	MOV	AX, CX					;setup to update pwr10 AX <-- pwr10 ([DIV n] does AX/n]
	MOV CX, 10					;load CX with 10 so we can divide pwr10 (CX <-- 10)
	MOV DX, 0					;prepare for dividing (although we won't need DX)
	DIV	CX						;divide by 10 AX <-- pwr10/10 (AX <-- AX / CX)
	MOV	CX, AX					;update pwr10 (CX <-- AX)
	JMP	MainDecLoop				;restart process

TooBigDecError:					;value was too big
	STC							;set the error flag
	;JMP	EndDecString		;move on to end of function

EndDecString:
	POP SI
	RET

Dec2String	ENDP




; Hex2String
;
;Description:			This function takes a 16-bit number along with a location in
;						memory and will turn the 16-bit number into the hex string
;						representation.  It will do this by looking at the number four
;						bits at a time, finding what those 4 bits correspond to in hex
;						(notice that 4 bits can hold 16 different values, so there is no
;						other conversion necessary), then writing to the array the hex
;						character corresponding to it.  The string will start at the
;						specified location in memory and end with the ASCII null
;						character.  This function assumes that the number to be changed
;						was passed in AX and that the location to store the array was
;						passed in SI.
;
;Operation:       		This function operates by looking at four bits at a time and
;						converts those four bits into a character in hex.  This works
;						because 16 is a power of 2.  It then saves that number in a string
;						by saving it as '0' + the number the 4 bits come out to.  Because
;						'A' is 8 greater than '9', translating 11 to 'A' requires
;						'0' + 11 + 7.  At the end, it adds the ASCII NULL character,
;						saved in ASCII.inc as ASCIInull.  If at any point there is an
;						error, the function changes the appropriate flag and stops,
;						indicating an error occurred.
;
;Arguments:      		AX - a 16-bit integer to be turned into a string of hex digits
;                       SI - the location in memory at which the hex string will be stored
;
;Return Values:       	None.
;
;Global Variables:    	None.
;
;Shared Variables:      None.
;
;Local Variables:   	error (Flags) - initially FALSE unless set TRUE by the function in
;						the case of an error.
;
;                       index (BX) - keeps track of how many times we have added a number
;						to our hex string.  It should be no more than 4 times, as
;						16 bits / 4 bits per iteration equals 4.
;
;						digit (CX) - the left four bits of our input variable.  This uses
;						digit to figure out what character to write to the array.
;
;Registers Changed:		AX, BX, CX, DX, SI
;
;Inputs:              	None.
;
;Outputs:            	None.
;
;Error Handling:    	The only foreseeable errors would be a result of incorrect inputs
;						by the function caller.
;
;Algorithms:        	None.
;
;Data Structures:    	Array - used to store the hex string representation
;
;Limitations:         	This does not work if the input is greater than 65535.
;						Additionally, if it tries to convert a number not between 0 and 15
;						to hex, an error will be raised.
;
;Known Bugs:        	None.
;
;Special Notes:			None.
;
; Author:				Tim Menninger
; Last Modified:		October 27, 2014

Hex2String      PROC        NEAR
                PUBLIC      Hex2String

	PUSHA

MakeHexString:					;initialization
	MOV	DX, AX					;store input in DX (DX will be n)
	MOV	BX, 0					;index starts at 0 (BX will be index)
	CLC							;no error as of yet
	;JMP	MainHexLoop			;begin our main loop

MainHexLoop:					;this is our main loop
	CMP	BX, 4					;only want while loop running 4 times (BX is index)
	JAE	EndHexString			;if index is 4 or more, we are done calculating
	;JB	CalcHexString			;if index is less than 4, calculate next character

CalcHexString:					;calculate the string in hex
	MOV	CX, DX					;store input number in CX
	SHR	CX, 12					;(CX is digit) have CX equal just leftmost 4 bits
	CMP	CX, 10					;see if digit should be A-F (10-15 in decimal)
	JAE	HexCharGE10				;if greater than or equal to 10, will have to write A-F
	;JB	HexCharLT10				;if less than 10, we want to write 0-9

HexCharLT10:					;proc. to write 0-9 (input unsigned, so sign irrelev.)
	ADD CX, '0'					;convert CX to ASCII character
	MOV BYTE PTR [SI], CL		;load ASCII character into array
	JMP	NextNumber				;now look at next number

HexCharGE10:					;handles when digit (CX) is greater or equal to 10
	CMP CX, 16					;digit (CX) cannot be greater than or equal to 16
	JAE TooBigHexError			;if number > 15, we have an error
	;JB HexChar10to15			;can now fill array, as we know the number is valid

HexChar10to15:					;proc. to write letter corresponding to 10-15
	ADD	CX, ('A' - 10)			;convert 10-15 to ASCII characters A-F
	MOV BYTE PTR [SI], CL		;write CX to array at SI
	;JMP	NextNumber			;Now look at next number

NextNumber:						;prepare to go through next iteration of loop
	SHL	DX, 4					;shift left so we can look at first 4 bits again
	INC	BX						;increment our index counter (BX <-- BX + 1)
	INC	SI						;increment our array pointer (SI <-- SI + 1)
	JMP	MainHexLoop				;restart loop

TooBigHexError:					;handle error related to invalid hex numbers
	STC							;set the carry flag, a number was > 4 bits
	;JMP EndHexString			;want to finish our process now

EndHexString:					;add null character and end program
	MOV BYTE PTR [SI], 0		;load NULL into array
	POPA
	RET

Hex2String	ENDP



CODE    ENDS



        END
