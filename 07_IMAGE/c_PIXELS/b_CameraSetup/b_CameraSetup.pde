/*

*/

/////////////////////////// GLOBALS ////////////////////////////

import processing.video.*;
Capture cam;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480, P2D);
  background(255);
  smooth();
  noStroke();
  //println(Capture.list());
  // This is a nifty way to see what cameras are connected to the puter
  //printArray(Capture.list()); 
  // We can then choose one of these when we create a new cam object
  cam = new Capture(this, width, height, 30);
  cam.start();

 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
   background(255);
   cam.read();
   image(cam, 0,0);
   
   
}

/////////////////////////// FUNCTIONS ////////////////////////////

