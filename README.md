# Arduino_blink_MAX_2666KHz

usually Arduino & blinking test is very slow rate in term of 1Hz or one blink per second for human eyes visual. One day I need some convenient clock source and required relatively high speed or in MHz range, the target was 6MHz, but turn out and some simple math, except 8MHz / 4MHz could be done via Timer, everything rendered I/O and CPU overloaded, 2.67MHz max or and lower fraction, that was all.

Ofcourse, 2.67MHz is not for eye balls, need oscilloscope or frequency counter, I have no both of that, just coding and try, it should be 2.67MHz in Max, should be. why? see the code and count the CPU cycle and math, you will see why.
