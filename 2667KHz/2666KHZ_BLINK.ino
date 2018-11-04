/* 
 *  Blink the LED of Arduino Mega2560 LED, pure C programming, complie with Arduino IDE 1.6.11
 *  xiaolaba, 2016-NOV-05
 *  
 *  xiaolaba, 2018-NOV-03, try 6MHZ clock signal generation, use ATmega328 (Arduino UNO), Arduino IDE 1.8.5
 *  it is not possible to unless change Xtal.
 *  
 *  dump disassembly code 
 *    hold [shift] and compile the code, see the path of firmware, there will be *.elf
 *    PATH=%PATH%;C:\Program Files (x86)\Arduino\hardware\tools\avr\avr\bin\
 *    objdump -S C:\Users\user0\AppData\Local\Temp\arduino_build_533545\2666KHZ_BLINK.ino.elf > 2666KHZ_BLINK.asm
*/
 
// ref  : https://balau82.wordpress.com/2011/03/29/programming-arduino-uno-in-pure-c/
// Programming Arduino Uno in pure C
 
#include <avr/io.h>
#include <util/delay.h>
 
#define BLINK_SLOW_DELAY_MS 1000
#define BLINK_FAST_DELAY_MS 200

//#define LED_pin 7 // LED pin# = Atmege2560 pin PB7 = Arduino Mega2560 D13
//#define LED_pin 5 // LED pin# = Atmege328 pin PB5 = Arduino UNO D13
#define LED_pin 1 // LED pin# = Atmege328 pin PB1 = Arduino UNO D9, same pin as OC1A

#define ddtick  __asm__("nop\n\t");
#define dd4tick  __asm__("nop\n\t""nop\n\t""nop\n\t""nop\n\t");
// the Macro dd4tick will delay 0.25us exactly on 16MHz Arduino
#define delayOneUs()  { dd4tick; dd4tick; dd4tick; dd4tick; }

 
int main (void)
{

  DDRB |= _BV(LED_pin); /* set LED_pin of PORTB for output*/
 
  while(1) {
    blinkMHZ();
    
    blink_fast();
    blink_fast();
    blink_fast();
    blink_slow();
  }
}
 
void blink_slow ()
{
  PORTB |= _BV(LED_pin);    /* set LED_pin high to turn led on */
  _delay_ms(BLINK_SLOW_DELAY_MS);
   
  PORTB &= ~_BV(LED_pin);    /* set LED_pin low to turn led off */
  _delay_ms(BLINK_SLOW_DELAY_MS);
}
 
void blink_fast ()
{

  PORTB |= _BV(LED_pin);    /* set LED_pin high to turn led on */
  _delay_ms(BLINK_FAST_DELAY_MS);
   
  PORTB &= ~_BV(LED_pin);    /* set LED_pin low to turn led off */
  _delay_ms(BLINK_FAST_DELAY_MS);

}


void blinkMHZ ()
{

  register unsigned char counter asm("r24");
//... some code...
//asm volatile("clr r24");
//... more code...

  __asm volatile ("ldi r24,0b10101010 \n\t");
  __asm volatile ("clc \n\t");
  __asm volatile ("sei \n\t");
  
  __asm ("my_loop:");


//*****************************************
// 1.6MHZ  
  //PORTB ^= _BV(LED_pin);    /* toggle LED_pin, 1,6MHZ */
//*****************************************



//*****************************************
// 2.67MHZ, 
/*
asm volatile (
  "sbi %0, %1 \n"
  : : "I" (_SFR_IO_ADDR(PORTB)), "I" (PORTB1)
);
asm (
  "cbi %0, %1 \n"
  : : "I" (_SFR_IO_ADDR(PORTB)), "I" (PORTB1)
);
*/


// 2.67MHZ
  __asm (
    "sbi 0x05,1 \n\t"   // [2] cycles
    "cbi 0x05,1 \n\t"   // [2] cycles
  ::); 
//*****************************************



//*****************************************
// 2.0 MHZ
/*
 __asm volatile (
  "out 0x05,r24 \n\t"   // [1] PORTB address 0x05, [r24] 
  "com r24 \n\t"        // [1] toggle
 ::);
*/
//*****************************************



  __asm ("rjmp my_loop");    // [2]


//*****************************************
// test inline asm only, no excution here
  asm volatile(
    "nop\n\t"
    "nop\n\t"
    "nop\n\t"
    "nop\n\t"
  ::);
//*****************************************
  
}

//END of program
