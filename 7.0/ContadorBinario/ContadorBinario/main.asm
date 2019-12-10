2;
; ContadorBinario.asm
;
; Created: 18/10/2019 09:20:42 a. m.
; Author : Naomi
;


; Replace with your application code
.include<m328pdef.inc>

.org 0x000

rjmp start

start:
	ldi r16, 0b00000000 ; registro para configurar puertos de entrada
	ldi r17, 0b00000000 ; registro para encender los leds el cual se incrementará 
	ldi r18, 0b11111111 ; registro para configurar puertos de salida
	ldi r20, 63	; registro para decrementar el ciclo
	
	out DDRB, r18 	; configura el puerto D como salida
	out DDRD, r16 	; configura el prt B como entrada
	nop
	
	
CICLO:
	in r21, PIND 	; lee entrada del puerto B
	sbis PIND, 2 	;Si el bit de la posicion 2 es 1 se salta un registro, sino continua normal
	rjmp BOTON_OFF
	rjmp BOTON_ON

BOTON_ON:
	out PORTB, r17	; Enciende el led
	
	brbs 0, CICLO 	; Si el bit C del Rr SERG = 1, regresa a ciclo
	
	dec r20		; controla las repeticiones 
	cpi r20, 0 	; compara que el r21 sea igual a 0
	breq start 	; si el r21  = 0 brinca a start
	
	sec 		;activar bandera de SERG en el bit C=1
	inc r17 		; incrementa r17
	call delay_1000ms
	rjmp CICLO

BOTON_OFF:
	;ldi r19, 0b00000000	;Apaga LED
	out PORTB, r17	;Envia el código para apagar el LED
	clc			;vuelve 0 el bit C de Rr SERG
	rjmp CICLO




delay_1000ms:
ldi r19, 9

repetir2:
ldi r22, 99

repetir1:
ldi r23,199;

repetir:
nop
nop
nop
nop
nop
dec r23
brne repetir //2 ciclos
dec r22
brne repetir1
dec r19
brne repetir2
ret
