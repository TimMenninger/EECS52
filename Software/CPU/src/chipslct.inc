;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                        ;
;                                      CHIPSLCT.INC                                      ;
;                      Contains constants for setting up chip selects                    ;
;                                      Tim Menninger                                     ;
;                                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This file contains constants and addresses for Chip Selects
;Revision History:
;      11/07/14    Tim Menninger   Created
;      11/29/14    Tim Menninger   Added header
;      04/21/16    Tim Menninger   Added MMCS and LMCS
;

;Addresses
LMCSreg         EQU     0FFA2H	;address of LMCS register
PACSreg         EQU     0FFA4H	;address of PACS register
MMCSreg         EQU     0FFA6H	;address of MMCS register
MPCSreg         EQU     0FFA8H	;address of MPCS register

;Control Register Values
LMCSval         EQU     01FC0H	;128k LCS, use RDY, 0 wait states
                                ;00-- ---- ---- ----  reserved
								;--01 1111 11-- ----  A17:A10 of LCS end address 01FFFFH
								;---- ---- --00 0---  reserved
                                ;---- ---- ---- -0--  wait for RDY inputs (0)
                                ;---- ---- ---- --00  number of wait states
PACSval         EQU     00000H	;PCS base at 0, 0 wait states
                                ;0000 0000 00-- ----  starts at address 000000H
                                ;---- ---- --00 0---  reserved
                                ;---- ---- ---- -0--  wait for RDY inputs (0)
                                ;---- ---- ---- --00  number of wait states
MMCSval         EQU     02000H	;512k MCS (128k blocks), use RDY, 0 wait states
                                ;0010 000- ---- ----  starting address 20000H
                                ;---- ---0 0000 0---  reserved
                                ;---- ---- ---- -0--  wait for RDY inputs (0)
                                ;---- ---- ---- --00  number of wait states
MPCSval         EQU     01080H	;PCS in I/O space, use PCS5/6, 0 wait states
                                ;0--- ---- ---- ----  reserved
                                ;-001 0000 ---- ----  MCS is in 128KB blocks
                                ;---- ---- 1--- ----  1 outputs PCS5/PCS6
                                ;---- ---- -0-- ----  PCS in I/O space
								;---- ---- --00 0---  reserved
                                ;---- ---- ---- -0--  wait for RDY inputs (0)
                                ;---- ---- ---- --00  number of wait states
