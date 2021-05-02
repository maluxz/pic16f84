		list P=16f84a
		include <p16F84a.inc>
		__CONFIG _XT_OSC & _WDT_OFF & _PWRTE_ON

x		equ	h'1A' 
y		equ h'1B' 

		org 0
Conf	bsf		STATUS,RP0
		movlw b'00000000'
		movwf	TRISA	;Puerto A salida
		movlw b'11111111'
		movwf	TRISB	;	Puerto B entrada
		bcf		STATUS,RP0	

Sumar
		movf	PORTB,W	;Mueve PORTB a W

		movwf	x	;Mueve W a X

		swapf	x,0	;Intercambia nibbles de registro X y guarda en W

 		bcf		x,4	;Bit en posision 4 se coloca en 0
		bcf		x,5	;Bit en posision 4 se coloca en 0
		bcf		x,6	;Bit en posision 4 se coloca en 0
		bcf		x,7	;Bit en posision 4 se coloca en 0
		
		movwf	y	;Mueve W a Y
		bcf		y,4	;Bit en posision 4 se coloca en 0
		bcf		y,5	;Bit en posision 4 se coloca en 0
		bcf		y,6	;Bit en posision 4 se coloca en 0
		bcf		y,7	;Bit en posision 4 se coloca en 0

		movfw	y	;Mueve W a Y
		addwf	x,0	;Suma X a W

		movwf	PORTA	;Mueve W a PORTA

		goto 	Sumar	;Repite

		end