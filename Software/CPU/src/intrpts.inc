;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       INTRPTS.INC                                      ;
;                       Contains constants for setting up interrupts                     ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This file contains constants and addresses for interrupt vectors
;Revision History:
;       11/07/14    Tim Menninger   Created/Adapted from Glen George
;       11/29/14    Tim Menninger   Added header and INT0 constants/addresses
;       04/21/16    Tim Menninger   adapted to 80188 MP3 player

;General Constants
VECTOR_SIZE         EQU     4               ;size of each vector in bytes
NUM_VECTORS         EQU     256             ;number of vectors in vector table
FIRST_RESERVED_VEC  EQU     1               ;reserve vectors 1-3
LAST_RESERVED_VEC   EQU     3

;Addresses
PCB_BASE        EQU     0FF00H              ;base address of peripheral control block
INTCtrlrEOI     EQU     PCB_BASE + 22H      ;address of interrupt controller EOI register
INT_MASK_REG    EQU     PCB_BASE + 28H      ;address of interrupt mask register

;Interrupt values
NonSpecEOI      EQU     08000H              ;Non-specific EOI command
SpecEOI         EQU     00000H              ;0--- ---- ---- ----    0 for specific EOI
                                            ;-000 0000 000- ----    reserved
                                            ;---- ---- ---X XXXX    Relative to INT type
UNMASK_INT_MASK EQU     0FF0FH              ;1111 1111 ---- ----    maintainreserved
                                            ;---- ---- 0--- ----    unmask INT3
                                            ;---- ---- -0-- ----    unmask INT2
                                            ;---- ---- --0- ----    unmask INT1
                                            ;---- ---- ---0 ----    unmask INT0
                                            ;---- ---- ---- 1---    maintain DMA1
                                            ;---- ---- ---- -1--    maintain DMA0
                                            ;---- ---- ---- --1-    maintain reserved
                                            ;---- ---- ---- ---1    maintain timer

;Interrupt values specified
INT0Cntrl       EQU     PCB_BASE + 38H      ;address of INT0 control register
INT1Cntrl       EQU     PCB_BASE + 3AH      ;address of INT1 control register
INT2Cntrl       EQU     PCB_BASE + 3CH      ;address of INT2 control register
INT3Cntrl       EQU     PCB_BASE + 3EH      ;address of INT3 control register
TimerCntrl      EQU     PCB_BASE + 32H      ;address of Timer0 control register

INT0_VECTOR     EQU     12                  ;vector for INT0 in IVT
INT1_VECTOR     EQU     13                  ;vector for INT1 in IVT
INT2_VECTOR     EQU     14                  ;vector for INT2 in IVT
INT3_VECTOR     EQU     15                  ;vector for INT3 in IVT
Timer0_VECTOR   EQU     8                   ;vector for Timer0 in IVT

INT0EOI         EQU     SpecEOI + INT0_VECTOR   ;INT0 EOI
INT1EOI         EQU     SpecEOI + INT1_VECTOR   ;INT1 EOI
INT2EOI         EQU     SpecEOI + INT2_VECTOR   ;INT2 EOI
INT3EOI         EQU     SpecEOI + INT3_VECTOR   ;INT3 EOI
Timer0EOI       EQU     SpecEOI + Timer0_VECTOR ;Timer 0 EOI

INT0CtrlrCVal   EQU     00003H              ;set priority for INT0 enable
                                            ;0000 0000 000- ----    reserved
                                            ;---- ---- ---0 ----    0 for edge triggering
                                            ;---- ---- ---- 0---    enable INT0 interrupts
                                            ;---- ---- ---- -011    INT0 priority
INT1CtrlrCVal   EQU     0001BH              ;set priority for INT1 enable
                                            ;0000 0000 000- ----    reserved
                                            ;---- ---- ---1 ----    1 for level triggering
                                            ;---- ---- ---- 1---    disable INT1 interrupts
                                            ;---- ---- ---- -011    INT1 priority
INT2CtrlrCVal   EQU     0001BH              ;set priority for INT2 enable
                                            ;0000 0000 000- ----    reserved
                                            ;---- ---- ---1 ----    1 for level triggering
                                            ;---- ---- ---- 1---    disable INT2 interrupts
                                            ;---- ---- ---- -011    INT2 priority
INT3CtrlrCVal   EQU     00013H              ;set priority for INT3 enable
                                            ;0000 0000 000- ----    reserved
                                            ;---- ---- ---1 ----    1 for level triggering
                                            ;---- ---- ---- 0---    enable INT3 interrupts
                                            ;---- ---- ---- -011    INT3 priority

; Descriptive interrupt constants
ButtonEOI       EQU     INT0EOI
EncoderEOI      EQU     INT3EOI
