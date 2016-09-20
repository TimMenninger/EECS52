        NAME    BUTTONS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       BUTTONS.ASM                                      ;
;                                 Code for button routines                               ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;
;Description:      This has the code that handles button presses on the MP3 board by
;                  responding to an interrupt driven by a debouncer.
;
;Contents:         InitButtons - initializes variables to their no-buttons-pushed state
;                  ButtonHandler - responds to an interrupt driven by the debouncer,
;						which interrupts when a button is pressed.
;                  key_available - returns TRUE if a key is ready to be processed and
;						FALSE otherwise
;                  getkey - returns the next valid key ready to be processed and
;						blocks until a valid key is found
;
;Input:            Buttons - this program initializes the keypad and is called by the
;						event handler to scan for buttonpushes, debounce buttons and
;						respond to button pushes.
;
;Output:           None.
;
;Error Handling:   None.
;
;Data Structures:  Queue - This uses a queue to store events that are to occur as results
;						of button presses.
;
;Revision History: 05/14/16    Tim Menninger   Created
;

CGROUP  GROUP   CODE
DGROUP  GROUP   DATA


CODE    SEGMENT PUBLIC 'CODE'

        ASSUME  CS:CGROUP, DS:DGROUP

        EXTRN   QueueInit:NEAR  ;Initializes empty queue
        EXTRN   QueueEmpty:NEAR ;Checks if queue is empty
        EXTRN   Enqueue:NEAR    ;Enqueues a value
        EXTRN   Dequeue:NEAR    ;Dequeues a value



$INCLUDE(src\buttons.inc)           ;Constants related to buttons
$INCLUDE(src\queues.inc)            ;Contains the queue struct used for buttons



;
;InitButtons
;
;Description:       Initializes an empty queue that will later be used for
;                   enqueuing key events in response to pressed buttons.
;
;Operation:         This loads the button queue, queue length and byte/word
;                   boolean into the registers specified by QueueInit then
;                   calls QueueInit.
;
;Arguments:         None.
;
;Return Value:      None.
;
;Local Variables:   None.
;
;Shared Variables:  KeyPresses (WRITE) - Initializes an empty queue at this
;                      address
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            None.
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed: AX, DX
;
;Revision History:  05/14/16   Tim Menninger   Created
;

InitButtons     PROC        NEAR
                PUBLIC      InitButtons

ButtonQueueInit:
    PUSH	SI                  ;Store registers
	PUSH	BX

    LEA     SI, KeyPresses      ;QueueInit expects Queue in SI
    MOV     AL, BTN_QUEUE_LEN   ;QueueInit expects queue length in AL
    XOR     BL, BL              ;False indicates queue values are bytes
    CALL    QueueInit           ;Initialize queue with above parameters
   
ButtonPCSReset:                 ;Need to reset MAX6818 by reading from it
    IN      AL, BUTTON_PORT     ;Read the value of the buttons

DoneButtonInit:
    POP		SI                  ;Restore registers
	POP		BX
    RET

InitButtons      ENDP




;
;ButtonHandler
;
;Description:       Responds to a pressed button.  This is an interrupt handler
;                   that is called when the button debouncer forces an
;                   interrupt.  It can only process one key at a time, otherwise
;                   the behavior is undefined.
;
;Operation:         To decide which keys are currently being pressed, it inverts
;                   the button read from hardware so that buttons pressed are
;                   represented as 1's.  It then iterates through all of the
;                   bits in this byte and, if it is high, enqueues the key
;                   associated with that button.  To do this, it rotates right
;					and continually checks the most significant bit until iteration
;					reaches as many buttons as there are.  Because the address of
;					the button action table is incremented before first possible
;					access, it is essentially 1-indexed.
;
;Arguments:         None.
;
;Return Value:      None.
;
;Local Variables:   None.
;
;Shared Variables:  KeyPresses (WRITE) - Enqueues key events into this queue
;						when key presses are detected.
;
;Global Variables:  None.
;
;Input:             Buttons - Read from to enqueue events associated with
;						pressed buttons.
;
;Output:            None.
;
;Error Handling:    If key pressed corresponds with invalid key, then this
;						does not enqueue anything and continues as if the button
;						were not pressed.
;
;Limitations:       This has undefined behavior if two or more keys are being
;                   pressed.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed: None.
;
;Revision History:  05/14/16   Tim Menninger   Created
;

ButtonHandler   PROC        NEAR
                PUBLIC      ButtonHandler


ButtonHandlerInit:              ;Set variables used in this function
    PUSHA                       ;Store registers
    IN      AL, BUTTON_PORT     ;Retrieve which buttons are pressed
    MOV     DL, AL              ;Putting in DL to reserve AL for Enqueue call
    NOT     DX                  ;For iteration to work well, we want 1 to be
                                ;  pushed buttons' bits.
    XOR     BX, BX              ;Will be our counter for accessing table with
                                ;  button keys/values
	LEA     DI, ButtonTable     ;Get address of button table so we can read it
	LEA     SI, KeyPresses      ;Get the address of the key queue for Enqueue

CheckButton:                    ;Enqueues keys for button(s) are pressed
    CMP     BX, NUM_BUTTONS     ;See if we have checked all of the buttons
    JZ      DoneButtonHandler   ;We are done iterating if here.
	INC     BX                  ;Increment the button index we are looking at
	INC		DI					;Address of button action (useful if button is pressed)

	ROR     DL, 1               ;Rotate so we can check the next bit at bit 7
	TEST    DL, 80H 			;Check if highest bit is set
	JZ      CheckButton		    ;Button not pressed--check next button

EnqueueButtonCode:              ;Enqueues the button code corresponding to iter
    MOV     AL, CS:[DI]         ;Put key code in AL for us to enqueue
    XOR     AH, AH              ;Clear AH so we can use whole AX as argument
    CMP     AL, KEY_ILLEGAL     ;Don't want to enqueue invalid key
    JZ      CheckButton		    ;If key invalid, don't enqueue
    CALL    Enqueue             ;Enqueue the button code
    JMP     CheckButton		    ;Check next button

DoneButtonHandler:              ;Wrap up process
    POPA                        ;Restore registers
    RET

ButtonHandler   ENDP




;
;key_available
;
;Description:       This checks whether there is a key available to be
;                   processed.  If there is, 1 is returned.  Otherwise, 0
;                   is returned.  If there is no key pressed, this clears
;                   the last keys pressed variable.
;
;Operation:         This loads the address of the queue into the register
;                   specified by QueueEmpty then calls QueueEmpty with AX
;                   cleared.  If the zero flag is set by QueueEmpty, then
;                   AX is incremented.  The return value is in AX, which
;                   will be 0 if no key is available and 1 otherwise.
;
;Arguments:         None.
;
;Return Value:      AX - 0 if no key is available (meaning the queue is empty)
;                      and 1 otherwise.
;
;Local Variables:   None.
;
;Shared Variables:  KeyPresses (READ) - Read from to decide whether there is a
;                      key waiting to be processed.
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            None.
;
;Error Handling:    None.
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed: AX - return value
;
;Revision History:  05/14/16   Tim Menninger   Created
;

key_available   PROC        NEAR
                PUBLIC      key_available

KeyAvailable:                   ;Initialize any variables required
    PUSH    SI                  ;SI is callee-saved
    LEA     SI, KeyPresses      ;Load key presses queue for QueueEmpty
	XOR     AX, AX              ;Return value in AX
    CALL    QueueEmpty          ;Sets ZF if empty
    JZ      DoneKeyAvailable    ;If ZF from QueueEmpty, return with AX = 0
    INC     AX                  ;If not ZF, key available

DoneKeyAvailable:               ;Return from function
    POP     SI                  ;Restore SI (callee-saved)
    RET

key_available   ENDP




;
;get_key
;
;Description:       This gets the next key that is to be processed and returns
;                   it.
;
;Operation:         This loads the queue into the register specified by Dequeue
;                   and dequeues.  Dequeue blocks, so this function doesn't
;                   return until a key is returned.  It then checks the dequeued
;                   key against KEY_ILLEGAL and, if they are equal, tries again.
;                   The key pressed is returned in AX by Dequeue and thus not
;                   moved so that it is also in AX when get_key returns.
;
;Arguments:         None.
;
;Return Value:      AX - The key value that is to be processed next.
;
;Local Variables:   None.
;
;Shared Variables:  KeyPresses (WRITE) - The next key to be processed is
;                      dequeued.
;
;Global Variables:  None.
;
;Input:             None.
;
;Output:            None.
;
;Error Handling:    If the key dequeued is KEY_ILLEGAL, this dequeues the next
;                   key.  If the queue is empty, this blocks until there is a
;                   key is dequeued (the Dequeue function blocks).
;
;Algorithms:        None.
;
;Data Structures:   None.
;
;Registers Changed: None
;
;Revision History:  05/14/16   Tim Menninger   Created
;

getkey          PROC        NEAR
                PUBLIC      getkey

DequeueKey:                     ;Get the oldest key pressed
    LEA     SI, KeyPresses      ;Dequeue needs key queue in SI
    CALL    Dequeue             ;Puts key in AX.  Blocks until !QueueEmpty
    CMP     AX, KEY_ILLEGAL     ;Check whether the dequeued key was invalid
    JZ      DequeueKey          ;If the key was invalid, try again

    RET

getkey          ENDP






;
;ButtonTable
;
;Description:  This table takes a button number 0 through NUM_BUTTONS and in the
;              button's index, contains associated the key value.
;
;Author:       Tim Menninger
;Last Changed: 05/14/16
;
ButtonTable     LABEL   BYTE
                PUBLIC  ButtonTable

;   DB      Button Num      ;Button
    DB      KEY_ILLEGAL     ;Should never be indexed
    DB      KEY_TRACKUP     ;Track Forward
    DB      KEY_TRACKDOWN   ;Track Backward
    DB      KEY_PLAY        ;Play
    DB      KEY_STOP        ;Pause
    DB      KEY_FASTFWD     ;Fast Forward
    DB      KEY_REVERSE     ;Rewind
    DB      KEY_RPTPLAY     ;Repeat Play
    DB      KEY_ILLEGAL     ;Should never be indexed

CODE    ENDS





DATA    SEGMENT PUBLIC  'DATA'

    KeyPresses  QUEUE   <>  ;queue for events

DATA    ENDS



        END
