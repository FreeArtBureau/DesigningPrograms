/*
 * Full Screen
 * Displays sketchin full screen mode without frame 
 *
 * MW 3.11.15
 * http://docs.oracle.com/javase/7/docs/api/java/awt/Frame.html
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(displayWidth, displayHeight, P2D);
  background(0);
  smooth();
  rectMode(CENTER);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*0.009);
  float geoSize = sin(frameCount*0.005) * 473;
  fill(0, 0, 255);
  rect(0, 0, geoSize, geoSize);
  popMatrix();
}


/////////////////////////// FUNCTIONS ////////////////////////////

// overwrite PApplets init method
// to set the frame to undecorated=true 

public void init() {
  /// to make a frame not displayable, you can 
  // use frame.removeNotify() 
  frame.removeNotify(); 
  frame.setUndecorated(true); 
  // addNotify, here i am not sure if you have  
  // to add notify again.   
  frame.addNotify(); 
  super.init();
}

