;
; LedParpadeo.asm
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
ldi r21, 0b00000100
ldi r22, 0b00001000
ldi r23, 0b00010000
ldi r24, 0b00100000
ldi r25, 0b01000000
ldi r26, 0b10000000
ldi r27, 0b00000001
ldi r28, 0b00000010
ldi r29, 0b00000100
ldi r30, 0b00001000

out DDRD, r21
out DDRD, r22
out DDRD, r23
out DDRD, r24
out DDRD, r25
out DDRD, r26
out DDRD, r27
out DDRB, r28
out DDRB, r29
out DDRB, r30

ldi r20, 0b00000000
out PORTD, r20
call delay_1000ms
out PORTD, r21

call delay_1000ms
out PORTD, r20
out PORTD, r22

call delay_1000ms
out PORTD, r20
out PORTD, r23

call delay_1000ms
out PORTD, r20
out PORTD, r24

call delay_1000ms
out PORTD, r20
out PORTD, r25

call delay_1000ms
out PORTD, r20
out PORTD, r26

call delay_1000ms
out PORTD, r20
out PORTD, r27

call delay_1000ms
out PORTD, r20
out PORTB, r28

call delay_1000ms
out PORTB, r20
out PORTB, r29

call delay_1000ms
out PORTB, r20
out PORTB, r30
rjmp start

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