;Actividad 
;Proyecto: sumador
;Programa recibe dos nibbles del puerto B
;los suma y los muestra a través del puerto A.
;Autor: Equipo 1
;Integrantes:
;MARIO ALEJANDRO LUJAN MIRANDA
;MÓNICA VIANNEY HERNÁNDEZ CARLOS
;CRISTIAN EDUARDO PICASSO AMPARAN
;JONATHAN ALEJANDRO AGUILERA MOYA
;EDUARDO ANTONIO CRUZ MENDOZA
;Fecha: 19 Abril 2021
		list p=16f84a
		include <p16F84a.inc>
		__CONFIG _XT_OSC & _WDT_OFF & _PWRTE_ON
;etiquetas/variables
j		equ	h'1F' ;Asigna un espacio de memoria a la variable j
k		equ h'1E' ;Asigna un espacio de memoria a la variable k
;i		equ h'1D' ;Asigna un espacio de memoria a la variable k

		org 0
Inicio	bsf		STATUS,RP0	;Acceso al Banco 1.
		clrf	TRISA	;Las lineas del puerto A se configuran como salidas
		movlw b'11111111'
		movwf	TRISB	;Las lineas del puerto B se configuran como entradas
		bcf		STATUS,RP0	;Acceso al banco 0

Principal
		movf	PORTB,W	;Mover byte de B a registro W
		movwf	j	;Mover W con byte a registro J
 		bcf		j,4	;Limpiar nibble dejando los 4 bits menos significativos
		bcf		j,5
		bcf		j,6
		bcf		j,7

		movwf	k	;Mover W con byte a registro K
		rrf		k,1	;Limpiar nibble dejando los 4 bits mas significativos
		rrf		k,1
		rrf		k,1
		rrf		k,1
		bcf		k,4
		bcf		k,5
		bcf		k,6
		bcf		k,7

		movfw	k	;Mover nibble1 a registro de trabajo
		addwf	j,0	;Sumar nibble1 con nibble2 y guarda en registro W

		movwf	PORTA	;Mueve registro W a port A mostrando resultado

		goto 	Principal

		end