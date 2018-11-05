/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

import processing.video.*;
Capture cam;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480);
  background(0);
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
  //background(0);

  cam.read();
  cam.loadPixels();
  loadPixels();
  float maxBrightness = 0;
  int brightPixel = 0;

  for (int i=0; i<cam.pixels.length; i++) {
    if (brightness(cam.pixels[i])>233) {
      pixels[i] = color(0,0,255);
    }
  }

updatePixels();
}




/////////////////////////// FUNCTIONS ////////////////////////////