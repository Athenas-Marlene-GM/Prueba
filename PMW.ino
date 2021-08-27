#include <LiquidCrystal.h>
int ledPin = 9;      // LED connected to digital pin 9
int analogPin = A0;   // potentiometer connected to analog pin 3
int val = 0;         // variable to store the read value
const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
void setup() {
  pinMode(ledPin, OUTPUT);  // sets the pin as output
  
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // Print a message to the LCD.
  lcd.print("Valor salida PWM:");
}

void loop() {
  
  val = analogRead(analogPin);  // read the input pin
  val=val/4;
  lcd.setCursor(0, 1);
  lcd.print(val);
  analogWrite(ledPin,val); // analogRead values go from 0 to 1023, analogWrite values from 0 to 255
}
