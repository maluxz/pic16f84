;Actividad 
;Proyecto: semaforo
;Programa que controla DOS semáforos de 3 COLORES
;Asignando 25 segundos al VERDE, 5 al AMARILLO y 30 al rojo (AMARILLO + VERDE = ROJO)
;Autor: Equipo 2
;Fecha: 30 Abril 2021
		list p=16f84a
		include <p16F84a.inc>
		__CONFIG _RC_OSC & _WDT_OFF & _PWRTE_ON

i		equ	h'1A'
j		equ	h'1B'
k		equ	h'1C'

		org 0
Inicio	bsf		STATUS,RP0
		clrf	TRISB		;Puerto B como entrada
		bcf		STATUS,RP0	;Banco
		#DEFINE	R1	PORTB,0	;Rojo de Semáforo 1
		#DEFINE	A1	PORTB,1	;Amarillo de Semáforo 1
		#DEFINE	V1	PORTB,2	;Verde de Semáforo 1
		#DEFINE	R2	PORTB,3	;Rojo de Semáforo 2
		#DEFINE	A2	PORTB,4	;Amarillo de Semáforo 2
		#DEFINE	V2	PORTB,5	;Verde de Semáforo 2

Principal
			clrf	PORTB
			bsf		R1	;R1 V2
			bsf		V2

			;DELAY 25S
			movlw	d'255'
			movwf	i			;1 ciclo
			movlw	d'255'
EsperarI	movwf	j			;1 ciclo
			movlw	d'128'
EsperarJ	movwf	k			;1 ciclo
EsperarK	decfsz	k,1			;1 ciclo, 2 final
			goto	EsperarK	;2 ciclos
			decfsz	j,1			;1 ciclo, 2 final
			goto	EsperarJ	;2 ciclos
			decfsz	i,1			;1 ciclo, 2 final
			goto	EsperarI	;2 ciclos
	
			clrf	PORTB
			bsf	R1
			bsf	A2

			;DELAY 5S
			movlw	d'255'
			movwf	i			;1 ciclo
			movlw	d'255'
EsperarIA	movwf	j			;1 ciclo
			movlw	d'26'
EsperarJA	movwf	k			;1 ciclo
EsperarKA	decfsz	k,1			;1 ciclo, 2 final
			goto	EsperarKA	;2 ciclos
			decfsz	j,1			;1 ciclo, 2 final
			goto	EsperarJA	;2 ciclos
			decfsz	i,1			;1 ciclo, 2 final
			goto	EsperarIA	;2 ciclos

			clrf	PORTB
			bsf	V1
			bsf	R2

			;DELAY 25S
			movlw	d'255'
			movwf	i			;1 ciclo
			movlw	d'255'
EsperarIB	movwf	j			;1 ciclo
			movlw	d'128'
EsperarJB	movwf	k			;1 ciclo
EsperarKB	decfsz	k,1			;1 ciclo, 2 final
			goto	EsperarKB	;2 ciclos
			decfsz	j,1			;1 ciclo, 2 final
			goto	EsperarJB	;2 ciclos
			decfsz	i,1			;1 ciclo, 2 final
			goto	EsperarIB	;2 ciclos

			clrf	PORTB
			bsf	A1
			bsf	A2

			;DELAY 5S
			movlw	d'255'
			movwf	i			;1 ciclo
			movlw	d'255'
EsperarIC	movwf	j			;1 ciclo
			movlw	d'26'
EsperarJC	movwf	k			;1 ciclo
EsperarKC	decfsz	k,1			;1 ciclo, 2 final
			goto	EsperarKC	;2 ciclos
			decfsz	j,1			;1 ciclo, 2 final
			goto	EsperarJC	;2 ciclos
			decfsz	i,1			;1 ciclo, 2 final
			goto	EsperarIC	;2 ciclos

			end