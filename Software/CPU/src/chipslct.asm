       NAME  CHIPSELECT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                       CHIPSLCT.ASM                                     ;
;                                   Sets up chip selects                                 ;
;                                       Tim Menninger                                    ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;Description:      This code initializes the chip selects.
;
;Contents:			InitCS - initializes chip selects
;
;Input:            None.
;
;Output:           The ports relating to the keypads and displays are written
;					values so we can access them.
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
;	11/11/92  Glen George      initial revision (originally ISRDEMO.ASM)
;	11/07/14  Tim Menninger	adapted to supplement RoboTrike processes
;   04/21/16  Tim Menninger    adapted for 80188 MP3 player
;


;local include files
$INCLUDE(chipslct.inc)



CGROUP	GROUP	CODE


CODE	SEGMENT PUBLIC 'CODE'

        ASSUME  CS:CGROUP


;InitCS
;
;Description:       Initialize the Peripheral Chip Selects on the 80188.
;
;Operation:         Write the initial values to the PACS, MPCS, MMCS and LMCS
;                   registers.
;
;Arguments:         None.
;Return Value:      None.
;
;Local Variables:   None.
;Shared Variables:  None.
;Global Variables:  None.
;
;Input:             None.
;Output:            None.
;
;Error Handling:    None.
;
;Algorithms:        None.
;Data Structures:   None.
;
;Registers Changed: AX, DX

InitCS  PROC    NEAR
		PUBLIC	InitCS


        MOV     DX, LMCSreg     ;setup to write to LMCS register
        MOV     AX, LMCSval
        OUT     DX, AL          ;write PACSval to LMCS

        MOV     DX, PACSreg     ;setup to write to PACS register
        MOV     AX, PACSval
        OUT     DX, AL          ;write PACSval to PACS

        MOV     DX, MMCSreg     ;setup to write to MMCS register
        MOV     AX, MMCSval
        OUT     DX, AL          ;write PACSval to MMCS

        MOV     DX, MPCSreg     ;setup to write to MPCS register
        MOV     AX, MPCSval
        OUT     DX, AL          ;write MPCSval to MPCS

        RET                     ;done so return


InitCS  ENDP

CODE	ENDS


		END
