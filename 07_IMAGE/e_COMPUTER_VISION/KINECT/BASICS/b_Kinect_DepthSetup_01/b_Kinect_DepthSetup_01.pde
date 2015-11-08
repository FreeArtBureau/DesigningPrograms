/*
:::::::::::::::
COMPUTER VISION
:::::::::::::::

> KINECT
  Sketch : Kinect_DepthSetup_01
  This sketch demonstrates how to get real world
  values for the distance of a pixel in space.
*/

/////////////////////////// GLOBALS ////////////////////////////

import SimpleOpenNI.*;
SimpleOpenNI  kinect;
PImage depthImage;
 
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480);
  background(255);
  smooth();
  
  kinect = new SimpleOpenNI(this);
  //kinect.enableRGB(); // activate RGB camera
  kinect.enableDepth(); // activate infra red cam

 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
   background(255);
   kinect.update(); // always call this method
   depthImage = kinect.depthImage();
   
   image(depthImage, 0,0);
   //image(kinect.rgbImage(), 640, 0);
   
}

/////////////////////////// FUNCTIONS ////////////////////////////
void mousePressed() {
  // Get raw depth data
  int[] depth = kinect.depthMap(); 
 //Pick a pixel position
 int clickedPos = (mouseY*width)+mouseX; // 1D Image Array conversion
 int millimeters = depth[clickedPos];
 
 float inches = millimeters/25.4;
 println("Pixel distance = "+inches+" inches");
 println("Pixel distance = "+millimeters+" millimeters");

}

void keyPressed() {  
  
 // SAVE FRAME 
 if(key == 's') {
  saveFrame("KinectImage.png");
 } 
}
