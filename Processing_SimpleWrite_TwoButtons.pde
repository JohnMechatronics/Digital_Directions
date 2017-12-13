/**
 * Simple Write. 
 * 
 * Check if the mouse is over a rectangle and writes the status to the serial port. 
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;        // Data received from the serial port

void setup() 
{
  size(600, 600);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(255);
  if (mouseOvergreenRect() == true) {  // If mouse is over square,
    fill(204);                    // change color and
    myPort.write('X');              // send an H to indicate mouse is over square
  } 
  else {                        // If mouse is not over square,
    fill(0,255,0);                      // change color and
    myPort.write('Z');              // send an L otherwise
  }
  rect(250, 50, 100, 100);         // Draw a green square
  
  
  if (mouseOverRedRect() == true) {  // If mouse is over square,
    fill(204);                    // change color and
    myPort.write('H');              // send an H to indicate mouse is over square
  } 
  else {                        // If mouse is not over square,
    fill(255,0,0);                      // change color and
    myPort.write('L');              // send an L otherwise
  }
  rect(50, 50, 100, 100);         // Draw a red square
  
  
  
  
  
}

boolean mouseOverRedRect() { // Test if mouse is over square
  return ((mouseX >= 50) && (mouseX <= 150) && (mouseY >= 50) && (mouseY <= 150));
}
boolean mouseOvergreenRect() { // Test if mouse is over square
  return ((mouseX >= 250) && (mouseX <= 350) && (mouseY >= 50) && (mouseY <= 150));
}