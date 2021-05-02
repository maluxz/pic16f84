		list p=16f84a
		include <p16F84a.inc>
		__CONFIG _RC_OSC & _WDT_OFF & _PWRTE_ON

j		equ	h'1F'
k		equ h'1E'
		org 0

		movlw	b'00000000'
		tris 	PORTB
		movlw	b'00000001'
		movwf	PORTB

mloop:	rlf	PORTB,f

		movlw	d'50'
		movwf	j
jloop	movf	k
kloop	decfsz	k,f
		goto	kloop
		decfsz	j,f
		goto jloop
		goto mloop

		end