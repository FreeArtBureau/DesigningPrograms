/*
:::::::::::::::
COMPUTER VISION
:::::::::::::::

> KINECT
  Sketch : Kinect_Connect_01
*/

/////////////////////////// GLOBALS ////////////////////////////

import SimpleOpenNI.*;
SimpleOpenNI  kinect;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640*2, 480);
  background(255);
  smooth();
  
  kinect = new SimpleOpenNI(this);
  kinect.enableRGB(); // activate RGB camera
  kinect.enableDepth(); // activate infra red cam

 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
   background(255);
   kinect.update(); // always call this method
   
   image(kinect.depthImage(), 0,0);
   image(kinect.rgbImage(), 640, 0);
   
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  
 if(key == 's') {
  saveFrame("KinectImage.png");
 } 
}
