/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////
//Import ControlP5 Library
import controlP5.*;
//Declare an object for our interface
ControlP5 INTERFACES;
ControlWindow CW; // new window

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
  // This is a function - See the INTERFACE TAB
  controlInit();
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
// NOTHING HERE FOR THE MOMENT ;–)


