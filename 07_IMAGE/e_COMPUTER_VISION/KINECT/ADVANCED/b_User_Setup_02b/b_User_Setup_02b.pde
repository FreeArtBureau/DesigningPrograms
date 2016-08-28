/*
 * :::::::::::::::
 * COMPUTER VISION
 * :::::::::::::::
 *
 * Kinect User_Setup_02
 * Demonstrates how to detect users and get different parts of the body
 *
 *
 * 3DSense
 * Links : http://blog.3dsense.org/programming/programming-for-kinect-4-kinect-app-with-skeleton-tracking-openni-2-0/
 * NI version 1.96
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////

import SimpleOpenNI.*; 

SimpleOpenNI  kinect; 
PImage img;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(640, 480); 
  smooth();
  noStroke();
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth(); 

  //asks OpenNI to initialize and start receiving User data
  kinect.enableUser(); 
  kinect.setMirror(true);  
  img=createImage(640, 480, RGB);
  img.loadPixels();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255); 
  //asks kinect to send new data
  kinect.update();
  
  // see functions tab
  updateDepthImage();
  
  //draws the depth map data as an image to the screen 
  //at position 0(left),0(top) corner
  image(img, 0, 0);
  

  ////////////////////////////////////////// draw significant points of users
  
  drawUserData(); // see functions tab
  
}

///////////////// FIN

