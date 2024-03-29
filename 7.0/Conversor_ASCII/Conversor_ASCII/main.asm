; USART ASCII - Binario.asm
;
; Created: 24/10/2019 18:19:03 p. m.
; Author : Emmanuel Chabl�, Nicol�s Canul, Eusebio Ajas, Naomi Garc�a


.include<m328pdef.inc>
.org 0x00

rjmp start

start:
	ldi r18, 48
	ldi r26, 48
	ldi r27, 48
	ldi r20, 8

	call UART_CONFIG
	call ASCII

CICLO:

	
	
	mov r16, r27			;r27 centenas
	call UART_TRANSMIT

	mov r16, r26			;r26 decenas
	call UART_TRANSMIT

	mov r16, r18			;unidades
	call UART_TRANSMIT
	; compara que el r21 sea igual a 0
							
	rjmp fin

UNIDAD:
	inc r18
	cpi r18, 58
	breq DECENA
	ret
	

DECENA:
	inc r26
	cpi r26, 58
	breq CENTENA
	ldi r18, 48
	ret

ASCII:
	call UNIDAD
	dec r20					; controla las repeticiones 
	cpi r20, 0
	breq CICLO
	rjmp ASCII

CENTENA:
	
	inc r27
	ldi r26, 48
	ldi r18, 48
	ret

UART_CONFIG:
	ldi r16, 0b00000110
	sts UCSR0C, r16

	ldi r17, 0b00000000
	ldi r16, 0b01100111

	sts UBRR0H, r17
	sts UBRR0L, r16

	ldi r16, 0b00011000
	sts UCSR0B, r16
	ret

UART_TRANSMIT:
	lds r17, UCSR0A
	bst r17, 5
	brts UART_FREE
	rjmp UART_TRANSMIT

UART_FREE:
	sts UDR0, r16
	ret

fin:
	nop
	rjmp fin
