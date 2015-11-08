/*
 :::::::::::::::
 COMPUTER VISION
 :::::::::::::::
 
 > VIDEO
 Sketch : Pixel Detection_01
 Get a pixel from the camera & display an ellipse at that position

 */
/////////////////////////// GLOBALS ////////////////////////////

import processing.video.*;
Capture cam;
int x, y;
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
  cam.start(); // add this line as of P5 V2
  //cam.read();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  noStroke();
    if (cam.available() == true) {
    cam.read();
  }
  cam.loadPixels();
  float maxBrightness = 0;
  int brightPixel = 0;

  for (int i=0; i<cam.pixels.length; i++) {
    
    if (brightness(cam.pixels[i])>maxBrightness) {
      //Store the bright pixel in an int
      maxBrightness =  brightness(cam.pixels[i]);
      // Store the pixel in our brightPixel
      brightPixel = i;
    }
  }

  // TO SHOW OUR BRIGHT PIXEL
  // First calculate it's position on the screen
  // using the following formula
  x = brightPixel % cam.width;
  // divide y by width ( int are returned ).
  // 560 / 569 = 0 for example
  y = brightPixel / cam.width;

  cam.updatePixels();
  image(cam, 0, 0);

  // Display the bright pixel with a circle
  fill(0, 0, 255);
  ellipse(x, y, 30, 30);
}




/////////////////////////// FUNCTIONS ////////////////////////////

