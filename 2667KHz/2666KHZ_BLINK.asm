
C:\Users\user0\AppData\Local\Temp\arduino_build_176838\2666KHZ_BLINK.ino.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 34 00 	jmp	0x68	; 0x68 <__ctors_end>
   4:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
   8:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
   c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  10:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  14:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  18:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  1c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  20:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  24:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  28:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  2c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  30:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  34:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  38:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  3c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  40:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  44:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  48:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  4c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  50:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  54:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  58:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  5c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  60:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  64:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>

00000068 <__ctors_end>:
  68:	11 24       	eor	r1, r1
  6a:	1f be       	out	0x3f, r1	; 63
  6c:	cf ef       	ldi	r28, 0xFF	; 255
  6e:	d8 e0       	ldi	r29, 0x08	; 8
  70:	de bf       	out	0x3e, r29	; 62
  72:	cd bf       	out	0x3d, r28	; 61
  74:	0e 94 55 00 	call	0xaa	; 0xaa <main>
  78:	0c 94 7b 00 	jmp	0xf6	; 0xf6 <_exit>

0000007c <__bad_interrupt>:
  7c:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000080 <_Z10blink_fastv>:
}
 
void blink_fast ()
{

  PORTB |= _BV(LED_pin);    /* set LED_pin high to turn led on */
  80:	29 9a       	sbi	0x05, 1	; 5
	#else
		//round up by default
		__ticks_dc = (uint32_t)(ceil(fabs(__tmp)));
	#endif

	__builtin_avr_delay_cycles(__ticks_dc);
  82:	2f ef       	ldi	r18, 0xFF	; 255
  84:	83 ec       	ldi	r24, 0xC3	; 195
  86:	99 e0       	ldi	r25, 0x09	; 9
  88:	21 50       	subi	r18, 0x01	; 1
  8a:	80 40       	sbci	r24, 0x00	; 0
  8c:	90 40       	sbci	r25, 0x00	; 0
  8e:	e1 f7       	brne	.-8      	; 0x88 <_Z10blink_fastv+0x8>
  90:	00 c0       	rjmp	.+0      	; 0x92 <_Z10blink_fastv+0x12>
  92:	00 00       	nop
  _delay_ms(BLINK_FAST_DELAY_MS);
   
  PORTB &= ~_BV(LED_pin);    /* set LED_pin low to turn led off */
  94:	29 98       	cbi	0x05, 1	; 5
  96:	2f ef       	ldi	r18, 0xFF	; 255
  98:	83 ec       	ldi	r24, 0xC3	; 195
  9a:	99 e0       	ldi	r25, 0x09	; 9
  9c:	21 50       	subi	r18, 0x01	; 1
  9e:	80 40       	sbci	r24, 0x00	; 0
  a0:	90 40       	sbci	r25, 0x00	; 0
  a2:	e1 f7       	brne	.-8      	; 0x9c <_Z10blink_fastv+0x1c>
  a4:	00 c0       	rjmp	.+0      	; 0xa6 <_Z10blink_fastv+0x26>
  a6:	00 00       	nop
  a8:	08 95       	ret

000000aa <main>:

 
int main (void)
{

  DDRB |= _BV(LED_pin); /* set LED_pin of PORTB for output*/
  aa:	21 9a       	sbi	0x04, 1	; 4
  register unsigned char counter asm("r24");
//... some code...
//asm volatile("clr r24");
//... more code...

  __asm volatile ("ldi r24,0b10101010 \n\t");
  ac:	8a ea       	ldi	r24, 0xAA	; 170
  __asm volatile ("clc \n\t");
  ae:	88 94       	clc
  __asm volatile ("sei \n\t");
  b0:	78 94       	sei

000000b2 <my_loop>:

// 2.67MHZ
  __asm (
    "sbi 0x05,1 \n\t"   // [2] cycles
    "cbi 0x05,1 \n\t"   // [2] cycles
  ::); 
  b2:	29 9a       	sbi	0x05, 1	; 5
  b4:	29 98       	cbi	0x05, 1	; 5
*/
//*****************************************



  __asm ("rjmp my_loop");    // [2]
  b6:	fd cf       	rjmp	.-6      	; 0xb2 <my_loop>
	...
  DDRB |= _BV(LED_pin); /* set LED_pin of PORTB for output*/
 
  while(1) {
    blinkMHZ();
    
    blink_fast();
  c0:	0e 94 40 00 	call	0x80	; 0x80 <_Z10blink_fastv>
    blink_fast();
  c4:	0e 94 40 00 	call	0x80	; 0x80 <_Z10blink_fastv>
    blink_fast();
  c8:	0e 94 40 00 	call	0x80	; 0x80 <_Z10blink_fastv>
  }
}
 
void blink_slow ()
{
  PORTB |= _BV(LED_pin);    /* set LED_pin high to turn led on */
  cc:	29 9a       	sbi	0x05, 1	; 5
  ce:	2f ef       	ldi	r18, 0xFF	; 255
  d0:	83 ed       	ldi	r24, 0xD3	; 211
  d2:	90 e3       	ldi	r25, 0x30	; 48
  d4:	21 50       	subi	r18, 0x01	; 1
  d6:	80 40       	sbci	r24, 0x00	; 0
  d8:	90 40       	sbci	r25, 0x00	; 0
  da:	e1 f7       	brne	.-8      	; 0xd4 <my_loop+0x22>
  dc:	00 c0       	rjmp	.+0      	; 0xde <my_loop+0x2c>
  de:	00 00       	nop
  _delay_ms(BLINK_SLOW_DELAY_MS);
   
  PORTB &= ~_BV(LED_pin);    /* set LED_pin low to turn led off */
  e0:	29 98       	cbi	0x05, 1	; 5
  e2:	2f ef       	ldi	r18, 0xFF	; 255
  e4:	83 ed       	ldi	r24, 0xD3	; 211
  e6:	90 e3       	ldi	r25, 0x30	; 48
  e8:	21 50       	subi	r18, 0x01	; 1
  ea:	80 40       	sbci	r24, 0x00	; 0
  ec:	90 40       	sbci	r25, 0x00	; 0
  ee:	e1 f7       	brne	.-8      	; 0xe8 <my_loop+0x36>
  f0:	00 c0       	rjmp	.+0      	; 0xf2 <my_loop+0x40>
  f2:	00 00       	nop
  f4:	db cf       	rjmp	.-74     	; 0xac <main+0x2>

000000f6 <_exit>:
  f6:	f8 94       	cli

000000f8 <__stop_program>:
  f8:	ff cf       	rjmp	.-2      	; 0xf8 <__stop_program>
