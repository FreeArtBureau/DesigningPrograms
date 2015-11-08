/*
:::::::::::::::
 COMPUTER VISION
 :::::::::::::::
 
 > KINECT
 Sketch : Kinect_SimpleTrack_01
 This sketch demonstrates to calculate the closest
 pixel in an image, grabbing the distance & position.
 */

/////////////////////////// GLOBALS ////////////////////////////

import SimpleOpenNI.*;
SimpleOpenNI  kinect;
PImage depthImage;

// Some variables for tracking distance & pos
int closestVal;
int closestX;
int closestY;

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
  closestVal = 8000;
  kinect.update(); // always call this method

  // Get raw depth data
  int[] depth = kinect.depthMap(); 

  for (int yPos=0; yPos < height; yPos++) {
    for (int xPos=0; xPos < width; xPos++) {
      // Grab pixel positions
      int i = yPos*width+xPos;
      // Grab distance for each pixel
      int currentDepthVal = kinect.depthMap()[i];

      // if that pixel is closest
      if (currentDepthVal>0 && currentDepthVal < closestVal) {
        //save its value
        closestVal = currentDepthVal;
        // & save its position
        closestX = xPos;
        closestY = yPos;
      }
    }
  }
  depthImage = kinect.depthImage();   
   image(depthImage, 0,0);
   fill(0,0,255);
   ellipse(closestX, closestY, 30,30);
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
  if (key == 's') {
    saveFrame("KinectImage.png");
  }
}

