;
; LedParpadeo.asm
;
; Created: 10/10/2019 09:24:40 a. m.
; Author : Naomi
;
//DDRB 0b00000000
//PORTB 0b00000000

; Replace with your application code

.include<m328pdef.inc>

.org 0x000

rjmp start

start:
ldi r21, 0b00000000
ldi r20, 0b00100000
out DDRB, r20
call delay_1000ms
call delay_1000ms
call delay_1000ms
call delay_1000ms
call delay_1000ms
out PORTB, r21

call delay_1000ms
call delay_1000ms
call delay_1000ms
call delay_1000ms
call delay_1000ms
out PORTB, r20
rjmp start

delay_1000ms:
ldi r19, 199

repetir2:
ldi r17, 99

repetir1:
ldi r18,99;

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