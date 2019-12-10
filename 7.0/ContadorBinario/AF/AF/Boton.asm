; Created: 10/10/2019 09:24:40 a. m.
; Author : Naomi G,Eusebio A, Emmanuel C, Nicolás
;
//DDRB 0b00000000
//PORTB 0b00000000

; Replace with your application code

.include<m328pdef.inc>

.org 0x000

rjmp start

start:
	ldi r16, 0b00100000
	out DDRB, r16
	nop

CICLO:
	in r17, PINB
	sbis PINB, 0
	;rjmp BOTON_OFF
	;rjmp BOTON_ON
	;bst r17, 0
	;brts BOTON_ON
	rjmp BTON_OFF
	rjmp BTON_ON
	rjmp CICLO

BOTON_ON:
	ldi r17, 0b00100000
	out PORTB, r17
	rjmp CICLO

BOTON_OFF:
	ldi r17, 0b00000000		;Apaga LED
	out PORTB, r17			;Envia el código para apagar el LED
	rjmp CICLO



