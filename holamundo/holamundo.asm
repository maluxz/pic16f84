	__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
	
	LIST p=16F84A
	INCLUDE <p16f84a.INC>
	
	ORG 0
	
Inicio
	bsf STATUS, RP0
	clrf TRISB
	movlw	b'11111111'
	movwf	TRISA
	bcf STATUS,RP0

Principal
	movf	PORTA,W
	movwf	PORTB
	goto	Principal

	END

