;Proyecto: lujan
;Programa para ejemplificar el uso
;de la funcionalidad debugg en mplab.
;Autor: Mario Alejandro Lujan Miranda
;Fecha: 3 Marzo 2021
		list p=16f84a
		include <p16F84a.inc>
		__CONFIG _RC_OSC & _WDT_OFF & _PWRTE_ON
;etiquetas/variables
j		equ	h'1F' ;Asigna un espacio de memoria a la variable j
k		equ h'1E' ;Asigna un espacio de memoria a la variable k
		org 0

		movlw	b'00000000'	;El registro W se carga con el valor de 8 bits 
		tris 	PORTB ;Coloca sentido de trabajo de PORTB
		movlw	b'00000001'	;El registro W se carga con el valor de 8 bits
		movwf	PORTB	;Mueve el contenido del registro W al registro "PORTB"

mloop:	rlf	PORTB,f	;(rlf f,d) Rotacion de un bit a la izquierda del contenido del registro "f" pasando por el bit de acarreo C.
					;Si d = 1 el resultado se almacena en "f", si d = 0 el resultado se almacena en W.

		movlw	d'50'	;(movlw k)El registro W se carga con el valor de 8 bits del literal "k".
		movwf	j	;Mueve el contenido del registro W al registro j.
jloop	movwf	k	;El contenido del registro k se carga en el registro destino dependiendo del valor de kloop
kloop	decfsz	k,f	;Decrementa f y salta si el resultado es 0
		goto	kloop	;Salto incondicional 
		decfsz	j,f
		goto jloop
		goto mloop

		end