#include "p16F628a.inc"
__CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program
 
i equ 0x30
j equ 0x31
k equ 0x32
l equ 0x33
m equ 0x34

START
 
    MOVLW 0x07
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0
    MOVLW b'00000010'
    MOVWF TRISB
    BCF STATUS, RP0
    
inicio:
	BSF PORTB, 0
	CALL t
	BCF PORTB, 0
	CALL t
	GOTO inicio
t:
	BTFSC PORTB, 1
	CALL tmp
	CAll tmp1
reg:
	RETURN
	
tmp1:	MOVLW d'2'
	MOVWF l
	CALL tmp
	DECFSZ l
	GOTO $-2
	nop
	GOTO reg
    
tmp:	MOVLW d'54'
	MOVWF i
loopj:	MOVLW d'50'
	MOVWF j
loopk:  MOVLW d'60'
	MOVWF k
	nop
	DECFSZ k
	GOTO $-1
	DECFSZ j
	GOTO loopk
	nop
	nop
	nop
	nop
	nop
	DECFSZ i
	GOTO loopj
	nop
	GOTO reg
END
