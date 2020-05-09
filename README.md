# Arduino_blink_MAX_2666KHz

usually Arduino & blinking test is very slow rate in term of 1Hz or one blink per second for human eyes visual. One day I need some convenient clock source and required relatively high speed or in MHz range, the target was 6MHz, but turn out and some simple math, except 8MHz / 4MHz could be done via Timer, everything rendered I/O and CPU overloaded, 2.67MHz max or and lower fraction, that was all.

Ofcourse, 2.67MHz is not for eye balls, need oscilloscope or frequency counter, I have no both of that, just coding and try, it should be 2.67MHz in Max, should be. why? see the code and count the CPU cycle and math, you will see why.

This is really AVR ATmega328P and 16MHz Xtal thus ultimate performance, because used Arduino IDE for the test, it is therefore open source, but it is really GCC code and snippet.  

output pin,  
In csae bare MCU, pin 15, PB1 / OC1A  
In case Ardunio Uno/Nano, D9  

 .  
 .  
 


![/8MHz/AVR_1MHZ_clock.JPG](/8MHz/AVR_1MHZ_clock.JPG)  

.
. 
.  
.  
  
### 1Khz square wave signal generator, 5Vpp  
2020-MAY-09  
To correct the formula, output frequency calculation, should be,   
16MHz / 2 / ocr1aval = 8MHz / ocr1aval, unit is in MHz,  
ocr1aval is ocr1a_value, 16 bit int  
re-arrange the formula to find ocr1a_value,  
ocr1aval = 8 / output frequency (in MHz), 1KHz/1000 = 0.001Mhz  
ocr1aval = 8 / 1Khz / 1000 = 8000 or 7999 +1  

source code and thus,
```
//const int ocr1aval  = 255; // 31.25KHz  // 2020-MAY-09, test done
//const int ocr1aval  = 511; // 15.625KHz // 2020-MAY-09, test done
//const int ocr1aval  = 1023;  // 7.8125KHz // 2020-MAY-09, test done
const int ocr1aval  = 7999;  // 1KHz // 2020-MAY-09, test done

```
  
  
    
### 1Khz signal generator, testing, and Android phone oscilloscope  
Mic input of old cell phone, act as signal input but DC biased and block DC path, sqaure wave signal became filter and distored, but it works for seeing oscillation or no signal present, easy and handful tool for hobby & DIY project at some time, audio frequency range and Guitar tunning at low range of frequency, it is so handly when compared with desktop scope in contrast.

.
.
output, looks good  
![/1KHz/xiaolaba_1KHz_5Vpp_CS4025_oscope_test.jpg](/1KHz/xiaolaba_1KHz_5Vpp_CS4025_oscope_test.jpg)
.  
.  
1ms/div, 5V/div, D9 output 1KHz, to confirm single source 
![/1KHz/xiaolaba_1KHz_5Vpp_CS4025_oscope_test1.jpg](/1KHz/xiaolaba_1KHz_5Vpp_CS4025_oscope_test1.jpg)
.  
.
xiaolaba_1KHz_5Vpp_HTC8088_oscope, testing
![/1KHz/xiaolaba_1KHz_5Vpp_HTC8088_oscope.jpg](/1KHz/xiaolaba_1KHz_5Vpp_HTC8088_oscope.jpg)
.  
.  
xiaolaba_1KHz_5Vpp_Samsung_GTS5660_oscope, testing
![/1KHz/xiaolaba_1KHz_5Vpp_Samsung_GTS5660_oscope.jpg](/1KHz/xiaolaba_1KHz_5Vpp_Samsung_GTS5660_oscope.jpg)

