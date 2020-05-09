/*
 *  asm ref: https://ucexperiment.wordpress.com/2016/03/11/arduino-inline-assembly-tutorial-5-2/
 *  source code ref : 
 *    http://forum.arduino.cc/index.php?topic=240200.0
 *    http://forum.arduino.cc/index.php?topic=432538.0
 *    
 *  xiaolaba, 2018-NOV-03 
 *  test, Arduino IDE 1.8.5
 *  
 *  xiaolaba, 2020-MAY-09
 *  change output frequency to 1KHz for MIC input / android phone oscope testing
 *  test, Arduino IDE 1.8.12
 * 
*/

const int freqOutputPin = 9;   // OC1A output pin for ATmega32u4 (Arduino Micro) & UNO

// ** output frequency =  Xtal / 2 * (1 + ocr1aval)
// ** 16MHZ / 2 = 8 MHZ


//const int ocr1aval  = 0; // 8MHZ, int = 16bit
//const int ocr1aval  = 1; // 4MHZ
//const int ocr1aval  = 2; // 2.67MHZ
//const int ocr1aval  = 3; //2.0MHZ
//const int ocr1aval  = 4; //1.6MHZ  
//const int ocr1aval  = 5; // 1.333MHZ
//const int ocr1aval  = 6; //1.143MHZ
//const int ocr1aval  = 7; //1.000MHZ  
//const int ocr1aval  = 8; // 889KHZ
//const int ocr1aval  = 9; //800KHZ
//const int ocr1aval  = 10; //727KHZ  
//const int ocr1aval  = 10; //667KHZ

//const int ocr1aval  = 255; // 31.25KHz  // 2020-MAY-09, test done
//const int ocr1aval  = 511; // 15.625KHz // 2020-MAY-09, test done
//const int ocr1aval  = 1023;  // 7.8125KHz // 2020-MAY-09, test done
const int ocr1aval  = 7999;  // 1KHz // 2020-MAY-09, test done


void setup()
{
    pinMode(freqOutputPin, OUTPUT);

    // Set Timer 1 CTC mode with no prescaling.  OC1A toggles on compare match
    //
    // WGM12:0 = 010: CTC Mode, toggle OC
    // WGM2 bits 1 and 0 are in TCCR1A,
    // WGM2 bit 2 and 3 are in TCCR1B
    // COM1A0 sets OC1A (arduino pin 9 on Arduino Micro) to toggle on compare match
    //   
    TCCR1A = ( (1 << COM1A0));

    // Set Timer 1  No prescaling  (i.e. prescale division = 1)
    //   
    TCCR1B = ((1 << WGM12) | (1 << CS10));

    // Make sure Compare-match register A interrupt for timer1 is disabled
    TIMSK1 = 0;

    // This value determines the output frequency
    OCR1A = ocr1aval;   // 8 bit register
}

void loop()
{

}
