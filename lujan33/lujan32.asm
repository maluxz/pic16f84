;Proyecto :  Práctica 3.2 Configuración de Puertos
;Autor: Mario Alejandro Lujan Miranda
;Fecha: 24 Marzo 2021

;ZONA DE DATOS
		__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC	;Configuracion para el grabador

		LIST P=16F84A			;Microcontrolador utilizado
		INCLUDE <P16F84A.INC>	;Defomocopm de algunos operandos utilizados

;ZONA DE CODIGOS
		ORG	0				;El programa comienza en la direccion 0 de memoria de programa
Inicio 	bsf		STATUS,RP0	;Acceso al Banco 1
		clrf	TRISB		;Las lineas del puerto B se configuran como salidas
		movlw	b'00011111'
		movwf	TRISA		;Las 5 lineas del puerto A se configuran como entradas
		bcf		STATUS,RP0	;Acceso al Banco 0
Principal
		movf	PORTA,W		;Carga el registro de datos del Puerto A en W
		movwf	PORTB		;El contenido de W se deposita en el Puerto B
		goto	Principal	;Se crea un bucle cerrado e infinito

		END