/*
:::::::::::::::
 COMPUTER VISION
 :::::::::::::::
 
 > KINECT
 Sketch : Kinect_SimpleTrack_02
 Drawing with the hand
 */

/////////////////////////// GLOBALS ////////////////////////////

import SimpleOpenNI.*;
SimpleOpenNI  kinect;
PImage depthImage;

// Some variables for tracking distance & pos
int closestVal;
int closestX;
int closestY;

int currentDepthVal;
float lastX;
float lastY;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480);
  background(0);
  smooth();

  kinect = new SimpleOpenNI(this);
  //kinect.enableRGB(); // activate RGB camera
  kinect.enableDepth(); // activate infra red cam
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0);
  closestVal = 8000;
  kinect.update(); // always call this method

  // Get raw depth data
  int[] depth = kinect.depthMap(); 

  for (int yPos=0; yPos < height; yPos++) {
    for (int xPos=0; xPos < width; xPos++) {
      // Grab pixel positions
      int i = yPos*width+xPos;
      // Grab distance for each pixel
      currentDepthVal = kinect.depthMap()[i];




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
  //image(depthImage, 0, 0);

  //fill(0, 0, 255);
  //ellipse(closestX, closestY, fatLine/5, fatLine/5);

  // INTERPOLATION !!!
  float interpolatedX = lerp(lastX, closestX, 0.1f); 
  float interpolatedY = lerp(lastY, closestY, 0.1f);
  stroke(255, 0, 0);

  float FAT = map(closestVal, 210,1525, 1,50);
  strokeWeight( FAT );
  //strokeWeight(2);

  line(lastX, lastY, interpolatedX, interpolatedY); 
  lastX = interpolatedX;
  lastY = interpolatedY;
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

