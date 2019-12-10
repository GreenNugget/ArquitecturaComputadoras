;
; PrimerProyecto.asm
;
; Created: 09/10/2019 12:38:27 p. m.
; Author : Naomi
;


.include<m328pdef.inc>

.org 0x000
rjmp start

start:

ldi r16, 0b00100000;
out DDRB, r16;
out PORTB, r16;
rjmp start