        NAME    QUEUE_ROUTINES

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       QUEUES.ASM                                       ;
;                                 Code for queue routines                                ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;
;Description:      This code contains routines related to the queue struct.  The struct
;                  itself is not in this file, but is included.
;
;Contents:		   QueueInit - initializes the queue attributes
;
;                  QueueFull - returns TRUE if the queue is full, FALSE otherwise
;
;                  QueueEmpty - returns TRUE if the queue is empty, FALSE otherwise
;
;                  Enqueue - takes a value and enqueues it if there is room, otherwise
;                  loops until there is room in the queue
;
;                  Dequeue - dequeues a value as long as the queue is not empty, otherwise
;                  loops until the queue is not empty
;
;Input:            None.
;
;Output:           None.
;
;User Interface:   None.
;
;Error Handling:   None.
;
;Algorithms:       None.
;
;Data Structures:  None.
;
;Revision History:
;    01/26/06  Glen George      initial revision
;	 10/31/14  Tim Menninger	added TODOs
;    11/29/14  Tim Menninger    cleaned up comments
;	 12/11/14  Tim Menninger	renamed from que_rout.asm to queues.asm
;


CGROUP  GROUP   CODE


CODE	SEGMENT PUBLIC 'CODE'


        ASSUME  CS:CGROUP


$INCLUDE(src\queues.inc)        ;includes the queue struct
$INCLUDE(src\common.inc)        ;includes constants not specific to any project


;
;QueueInit
;
;Description:		QueueInit takes three arguments, a location in the DS of memory at
;					which to store the queue, an integer representing the maximum number
;					of items allowed in the queue and a Boolean that is TRUE if the items
;					are words and FALSE if the items are bits.  It will then reference
;					the CreateQueue STRUCT in queue.inc to create the queue.  It will
;					take the location of memory and save the queue such that it starts
;					there, then save the size of the items and finally the total size of
;					the queue.  The total size of the queue is not crucial, but makes
;					some calculations easier to look at.  This function assumes that the
;					address, a, is passed in SI, the integer length, l, is passed in AX,
;					and the Boolean value is passed in BL.
;
;Operation:			This function operates by first creating a queue, referencing a
;					STRUCT defined in the queue.inc file, at the memory location, a,
;					which is passed as an argument.  It will do this by setting both the
;					head and the tail offsets at 0 so we start at a, assuming that
;					the queue begins empty.  After storing the queue, this function will
;					save the size of each element, which can either be a byte or a word.
;					This function then checks the Boolean input.  If it is true, then size
;                  is set to 2 and 1 otherwise.  Finally, this function sets the maximum
;					number of elements allowed in the queue.  This will allow other
;					functions utilizing QueueInit to multiply size and number of elements
;					to get the total amount of memory allocated for the queue.
;
;Arguments:			SI – a location in memory at which the queue is to be stored
;
;					AL – an int signifying maximum number of queued elements allowed
;
;					BL – a Boolean value that is TRUE if the item size is 2 bytes and
;					FALSE if the item size is 1 byte
;
;Return Values:		None.
;
;Global Variables:	None.
;
;Shared Variables:	None.
;
;Local Variables:	None.
;
;Registers Changed:	None.
;
;Inputs:			None.
;
;Outputs:			None.
;
;Error Handling:	None.
;
;Algorithms:		None.
;
;Data Structures:	Queues – head points at first in, tail points past last in
;
;Limitations:		This function cannot create a queue of element size other than 8 bits and
;					16 bits.
;
;Known Bugs:		None.
;
;Special Notes:		None.
;


QueueInit       PROC        NEAR
                PUBLIC      QueueInit

MakeQueue:					;SI contains memory location, AX contains max num of elements
							;	BL contains boolean where TRUE means dw FALSE means db
	MOV  [SI].head, HD_STRT ;made CL = 0, now load into head
	MOV  [SI].tail, TL_STRT ;made CL = 0, now load into tail
	MOV  [SI].item_max, AL	;assuming AX contains maximum allowed elements
	CMP  BL, FALSE			;see if BL is true or false
	JE   UseBytes			;if FALSE, element sizes are bytes
	;JNE UseWords			;otherwise, element sizes are words

UseWords:
	MOV  CL, USE_WORD		;CL should be 2 if the input, BL, is true
	JMP  EndInit

UseBytes:
   	MOV  CL, USE_BYTE		;now using CX to set size, which will be either 1 or 2
    ;JMP EndInit

EndInit:
	MOV  [SI].sze, CL		;load our 1 or 2 into the size
	RET

QueueInit	ENDP




;
;QueueFull
;
;Description:		This function takes as argument the memory location of a queue.  By
;					looking at the relative locations of the head and tail, it returns a
;					Boolean value: true if the queue is, in fact, full, and false
;					otherwise.  This function assumes that the memory location, a, is
;					passed in SI, and will return the Boolean value in BL.
;
;Operation:			This function takes as input a location in memory associated with a
;					queue that is assumed to be stored in SI.  It also assumes that
;					the enqueue and dequeue functions are written to change the queue
;					before incrementing the pointer.  That is, the head points at the
;					first-in element and the tail points one past the last-in element.
;					Thus, the queue is full when the tail points at the element in the
;					queue that is immediately before the element that the head points at.
;					We call a function that increments BX, taking into account the memory
;					limitations.  After this, we are left with a proper incrementation of
;					our head (but stored in BX because we do not want to increment head).
;					We compare the two values and if they are equal, meaning the queue
;					is full, then the zero flag is set.  The zero flag is what is returned.
;
;Arguments:			SI – the location in memory at which the queue in question is stored
;
;Return Values:		ZF - set if queue is full, clear otherwise
;
;Global Variables:	None.
;
;Shared Variables:	None.
;
;Local Variables:	None.
;
;Registers Changed:	Flags - zero flag is returned
;
;Inputs:			None.
;
;Outputs:			None.
;
;Error Handling:	None.
;
;Algorithms:		None.
;
;Data Structures:	Queues – head points at first in, tail points past last in
;
;Limitations:		This function only works if the input queue has its head pointing at
;					the first-in value and its tail pointing one past the last-in value.
;
;Known Bugs:		None.
;
;Special Notes:		None.
;


QueueFull       PROC        NEAR
                PUBLIC      QueueFull

StoreHeadTail:				;full when head = tail + 1
	PUSH BX					;want to remember registers
	MOV  BL, [SI].tail		;want to work with tail without making critical code
	CALL QueueInc			;add 1 to BL to see if head = tail + 1
	CMP  BL, [SI].head		;full if head = tail + 1 (zero flag set)
	POP  BX					;restore register
	RET

QueueFull	ENDP


;
;QueueEmpty
;
;Description:		This function is passed a location in memory with which a queue is
;					associated.  It will then look at the relationship between where its
;					head and tail point and return TRUE if the queue is empty.  If the
;					queue is not empty, the function returns FALSE.  This function
;					assumes that the memory address is passed in SI and will return the
;					Boolean value in BL.
;
;Operation:			This function takes as its argument a location in memory associated
;					with a queue that is assumed to be stored in SI.  It assumes that the
;					enqueue and dequeue functions are written to enqueue and dequeue
;					before incrementing the pointer.  That is, the head pointer points at
;					the first-in value and the tail pointer points one past the last-in
;					value.  Therefore, for the queue to be empty, the head pointer and
;					tail pointer must be pointing at the same location of memory.  So,
;					we check if the head offset and tail offset are equal.  If they are,
;					the zero flag is set and we know the queue is empty.  If not, the
;					the zero flag is reset and we know it is not.
;
;Arguments:			SI – a memory location with an associated queue
;
;Return Values:		ZF - set if queue is empty, clear if queue is not empty
;
;Global Variables:	None.
;
;Shared Variables:	None.
;
;Local Variables:	None.
;
;Registers Changed:	Flags - zero flag is returned
;
;Inputs:			None.
;
;Outputs:			None.
;
;Error Handling:	None.
;
;Algorithms:		None.
;
;Data Structures:	Queues – head points at first in, tail points past last in
;
;Limitations:		This function only works if the input queue has its head pointing at
;					the first-in value and its tail pointing one past the last-in value.
;
;Known Bugs:		None.
;
;Special Notes:		None.
;


QueueEmpty      PROC        NEAR
                PUBLIC      QueueEmpty

CheckEqual:					;if head = tail, the queue is empty
	PUSH BX					;remember registers
	MOV  BL, [SI].head		;want to eventually compare head to tail
	CMP	 BL, [SI].tail      ;comparing head offset to tail offset
	POP  BX					;restore registers
	RET

QueueEmpty	ENDP


;
;Dequeue
;
;Description:		This takes as input a location in memory that has an associated
;					queue.  It also assumes that the head pointer is pointing at the
;					first-in value.  It will look at the value stored where the head
;					pointer is pointing, save that value and increment the pointer.  It
;					will then return the value that was dequeued.  It will only return
;					NULL if there is an error.  If the head pointer is not pointing at
;					anything, it will iterate through the queue until either it finds
;					something or realizes the queue is empty.  This assumes that the
;					memory location was passed in SI and will return the dequeued value
;					in AL/AX.
;
;Operation:			This function takes a memory location associated with a queue as
;					input, assumed to be stored in SI.  This function checks whether
;					the queue takes bytes or words.  If it takes bytes, then it will
;					dequeue one byte and increment the head offset.  If it takes
;					words, then it will dequeue one byte, increment head, dequeue
;					another byte then dequeue again into the higher 8 bits of the
;					register the first dequeue was stored in (in this case AX).
;					It then returns the item.
;
;Arguments:			SI – a location in memory associated with a queue
;
;Return Values:		AX - a signed integer that was dequeued
;
;Global Variables:	None.
;
;Shared Variables:	None.
;
;Local Variables:	None.
;
;Registers Changed:	AX
;
;Inputs:			None.
;
;Outputs:			None.
;
;Error Handling:	If the queue is already empty, this function blocks.
;
;Algorithms:		None.
;
;Data Structures:	Queues – head points at first in, tail points past last in
;
;Limitations:		This function only works if the input queue has its head pointing at
;					the first-in value.
;
;Known Bugs:		None.
;
;Special Notes:		None.
;

Dequeue         PROC        NEAR
                PUBLIC      Dequeue

    PUSH BX                 ;store registers (those not returned)
    PUSH DX

CheckEmpty:					;block if empty
	CALL QueueEmpty			;will return 1 in BL if empty
	JZ   CheckEmpty			;if empty, check again
	;JMP PrepDequeue		;otherwise, do function

PrepDequeue:				;want to change registers so we can dequeue
	MOV  BL, [SI].head		;store our head offset in BX
	XOR  BH, BH  			;don't want high bits interfering when using BX
    MOV  AL, [SI].q_data[BX];dequeuing one byte either way
    XOR  AH, AH             ;want return value to be word, even if dequeuing byte
    CALL QueueInc           ;want to increment BL (our head) accounting for wrapping
	CMP  [SI].sze, USE_BYTE	;check if we are using bytes (if not, using words)
    JE   DoneDeq            ;if equal, we just dequeue once
	;JNE DeqWord			;otherwise, using words (dequeue two bytes)

DeqWord:					;get two bytes from dequeue
	MOV  AH, [SI].q_data[BX];store data
    CALL QueueInc           ;increment BX, possibly wrapping to beginning
	;JMP DoneDeq			;want to update head

DoneDeq:
    MOV  [SI].head, BL      ;want to store our new head offset into our queue attribute
    POP  DX                 ;restore registers
    POP  BX
	RET

Dequeue ENDP

;
;Enqueue
;
;Description:		This function takes as inputs a location in memory associated with a
;					queue and a value to enqueue.  It assumes the memory location is
;					stored in SI and the value to enqueue is stored in AX.  It then
;					checks to ensure that enqueueing something is a valid move given the
;					current state of the queue.  It then enqueues the value and
;					increments the pointer.
;
;Operation:			This function assumes that it has a memory stored in SI and a value
;					to enqueue stored in AX.  It also assumes that the tail points  ahead
;					of the last-in item.  This function starts by checking if the size
;					of elements is byte or word.  If it is byte, then the function will
;					write the value to be enqueued to where the tail offset indicates.
;					Then, it will increment tail.  If it is a word, then it will put the
;					low byte to where the tail indicates, increment tail, load the high
;					byte of the value and increment the tail again.  It has now enqueued
;					the value and returns.
;
;Arguments:			SI – the location in memory at which the queue is located
;
;				    AL – the value to enqueue
;
;Return Values:		None.
;
;Global Variables:	None.
;
;Shared Variables:	None.
;
;Local Variables:	None.
;
;Registers Changed: None.
;
;Inputs:			None.
;
;Outputs:			None.
;
;Error Handling:	If the queue is full, this function blocks.
;
;Algorithms:		None.
;
;Data Structures:	Queues – head points at first in, tail points past last in
;
;Limitations:		This function only works if the tail pointer points one item past the
;					last-in value.
;
;Known Bugs:		None.
;
;Special Notes:		None.
;

Enqueue         PROC        NEAR
                PUBLIC      Enqueue

    PUSHA

CheckFull:					;block if empty
	CALL QueueFull			;will set ZF fi full
	JZ   CheckFull			;if full, check again
	;JMP PrepEnqueue		;otherwise, do function

PrepEnqueue:				;want to change registers to prepare for enqueue
	MOV  BL, [SI].tail		;will manipulate BX as our tail
	MOV  BH, 0				;don't want high bits interfering when using BX
	MOV  [SI].q_data[BX], AL;enqueuing low byte either way
    CALL QueueInc           ;increment tail (in BL) because we just enqueued
	CMP  [SI].sze, USE_BYTE ;see if we are using bytes or words for our queue
    JE   DoneEnq            ;if bytes, only enqueue one byte (already done)
	;JNE EnqWord			;otherwise, enqueue another byte

EnqWord:					;get two bytes from dequeue
	MOV  [SI].q_data[BX], AH;store data into CL
	CALL QueueInc			;head offset in BX, increment BX
	;JMP DoneEnq			;want to update head

DoneEnq:
	MOV  [SI].tail, BL		;incremented BX, load it back into tail
    POPA
	RET

Enqueue ENDP

;
;QueueInc
;
;Description:		This takes as input an offset for the queue head or tail.  It will
;					increment the head/tail and then check if that increment caused it
;					to go outside of the allocated memory.  If it does, it will change
;					the head/tail accordingly.  Then, it will return the head/tail either
;					unchanged or updated.
;
;Operation:			This function takes the head/tail offset and adds one to it.  Then,
;					it compares it with the maximum the offset can be.  If it exceeds
;					that, then it is reset to 0, as we only ever increment by 1.
;
;Arguments:			SI - the memory location the head/tail refers to
;
;					BX – either a head or tail pointer to be incremented/possibly wrapped
;
;Return Values:		BX - the new and improved head or tail pointer
;
;Global Variables:	None.
;
;Shared Variables:	None.
;
;Local Variables:	None.
;
;Registers Changed:	BX
;
;Inputs:			None.
;
;Outputs:			None.
;
;Error Handling:	None.
;
;Algorithms:		None.
;
;Data Structures:	Queues – head points at first in, tail points past last in
;
;Limitations:		None.
;
;Known Bugs:		None.
;
;Special Notes:		None.
;

QueueInc        PROC        NEAR
                PUBLIC      QueueInc

Increment:					;must start by incrementing BX
	PUSH AX                 ;remember register
	INC  BL					;want to see implications of incrementing head/tail (in BL)
	MOV  AX, WORD PTR [SI].sze;want to multiply size
	MUL  [SI].item_max		;multiply by total number of items
	INC  AX					;array size must be one greater than item max
	CMP  BL, AL				;check if we are outside of allotted range
	JB   EndInc				;if not greater, then just return BX incremented
	;JAE ResetOffset		;if greater, want to reset offset

ResetOffset:
	MOV  BL, 0				;resets offset
	;JMP EndInc				;can now return new BX

EndInc:
	POP  AX                 ;restore register AX
	RET

QueueInc ENDP



CODE    ENDS



        END
