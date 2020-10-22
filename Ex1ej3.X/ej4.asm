#include "p16F628a.inc"
__CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program

k equ 0x32

START
 
    BCF STATUS, RP1
    BSF STATUS, RP0
    MOVLW b'11110000'
    MOVWF TRISB
    BCF STATUS, RP0
    nop
    INICIO:
	MOVLW d'60'
	MOVWF k
    KLOOP:
	DECFSZ k,F
	GOTO KLOOP
END
