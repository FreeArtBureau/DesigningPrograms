/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////
//Import ControlP5 Library
import controlP5.*;
// Also importing java.awt to manage our new window
import java.awt.Frame;
import java.awt.BorderLayout;

//Declare an object for our interface
ControlP5 INTERFACES;
ControlFrame CW; // new window

int circleDiameter;
int xInterval, yInterval;
float thickness;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(650, 450);
  background(255);
  smooth();
  noFill();  
  // Initialise Interface
  INTERFACES = new ControlP5(this); 
  // ADD NEW WINDOW
  CW = addControlFrame("controlP5window", 200, 300);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);

  for (int y = 75; y < height-50; y += yInterval) {       
    for (int x = 50; x < width-50; x += xInterval) {        
      stroke(0);
      strokeWeight( thickness );

      ellipse( x, y, circleDiameter, circleDiameter);
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

