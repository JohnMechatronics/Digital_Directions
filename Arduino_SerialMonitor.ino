/*
 * Sending data to the Serial Monitor
 * 
 */
int number = 0;

void setup() {
  Serial.begin(9600); //Send data at 9600 baud
}

void loop() {
  Serial.print("This number is ");
  Serial.println(number);
  delay(500);
  number++;
}
