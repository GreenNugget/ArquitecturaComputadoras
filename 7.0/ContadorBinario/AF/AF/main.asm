;
; AutoFantastico.asm
;
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
;PUERTO D
	ldi r21, 0b00000100
	ldi r22, 0b00001000
	ldi r23, 0b00010000
	ldi r24, 0b00100000
	ldi r25, 0b01000000
	ldi r26, 0b10000000

;PUERTO B se reutiliza el r21
	ldi r27, 0b00000001
	ldi r28, 0b00000010
	ldi r30, 0b00001000

;Cadenas para apgar y encender todos los puertos
	ldi r20, 0b00000000
	ldi r31, 0b11111111

;CONFIGURACION DE PUERTOS
	out DDRD, r31
	out DDRB, r31

	call delay_1000ms
	out PORTD, r21

	call delay_1000ms
	out PORTD, r22

	call delay_1000ms
	out PORTD, r23

	call delay_1000ms
	out PORTD, r24

	call delay_1000ms
	out PORTD, r25

	call delay_1000ms
	out PORTD, r26

	call delay_1000ms
	out PORTD, r20
	out PORTB, r27

	call delay_1000ms
	out PORTB, r28

	call delay_1000ms
	out PORTB, r21

	call delay_1000ms ;ultimo registro
	out PORTB, r30

	call inverso
rjmp start

inverso:			//Función para regresar el auto fantástico

	call delay_1000ms
	out PORTB, r21

	call delay_1000ms
	out PORTB, r28

	call delay_1000ms
	out PORTD, r20
	out PORTB, r27

	call delay_1000ms
	out PORTB, r20
	out PORTD, r26

	call delay_1000ms
	out PORTD, r25

	call delay_1000ms
	out PORTD, r24

	call delay_1000ms
	out PORTD, r23

	call delay_1000ms
	out PORTD, r22
	out PORTB, r20	
ret


delay_1000ms: //función para retrasar
	ldi r19, 99

	repetir2:
	ldi r17, 99

	repetir1:
	ldi r18,199;

	repetir:
	nop
	nop
	nop
	nop
	nop
	dec r18
	brne repetir //2 ciclos
	dec r17
	brne repetir1
	dec r19
	brne repetir2
ret