 // Wiring/Arduino code:
 // Read data from the serial and turn ON or OFF a light depending on the value
 
 char val; // Data received from the serial port
 int ledPin = 2; // Set the pin to digital I/O 4
 int ledPin2 = 3;

 
 void setup() {
 pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
 pinMode(ledPin2, OUTPUT);
 Serial.begin(9600); // Start serial communication at 9600 bps
 }
 
 void loop() {
  while (Serial.available()) { // If data is available to read,
  val = Serial.read(); // read it and store it in val
 
  if (val == 'R') { 
    digitalWrite(ledPin, HIGH); 
  } else if (val == 'G'){
    digitalWrite(ledPin2, HIGH); 
  } else  {
    digitalWrite(ledPin2, LOW); 
    digitalWrite(ledPin, LOW); 
  }
  delay(100); // Wait 100 milliseconds for next reading
 }