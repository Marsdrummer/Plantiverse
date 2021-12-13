/*
This sketch takes 4 analog sensor inputs from 
the Arduino, and publishes them to the serial port for
interpretation by a sketch in Processing. Thanks to 
https://www.arduino.cc/en/Tutorial/BuiltInExamples/SerialCallResponse 
Tom Igoe, Greg Shakar, and Scott Fitzgerald
for the fundamentals of this code.
*/

int sensor1 = 0; // analog input 0 (A0)
int sensor2 = 0; // A1
int sensor3 = 0; // A2
int sensor4 = 0; // A3

int inByte = 0;   // incoming serial byte
void setup()
{
 // start serial port at 9600 bps:
 Serial.begin(9600);
 while (!Serial) {
 ; // wait for serial port to connect. Needed for Leonardo only
 }
// pinMode(2, INPUT); // digital sensor is on digital pin 2
 establishContact(); // send a byte to establish contact until receiver responds
}
void loop()
{
 // if we get a valid byte, read analog ins:
 if (Serial.available() > 0) {
 // get incoming byte:
 inByte = Serial.read();
 // read first analog input, divide by 4 to make the range 0-255:
 sensor1 = analogRead(A0)/4;

 Serial.write(analogRead(A0)/4);
 Serial.write(analogRead(A1)/4);
 Serial.write(analogRead(A2)/4);
 Serial.write(analogRead(A3)/4);
 }
}
void establishContact() {
 while (Serial.available() <= 0) {
 Serial.print('A'); // send a capital A
 delay(300);
 }
}
