/*
 * :::::::::::::::
 * COMPUTER VISION
 * :::::::::::::::
 *
 * Kinect User_Setup_01
 * Demonstrates how to detect users and get different parts of the body
 *
 * - 'd' activates display of the depthImage
 *
 * MW_2015
 * Links : http://blog.3dsense.org/programming/programming-for-kinect-4-kinect-app-with-skeleton-tracking-openni-2-0/
 * NI version 1.96
 * end
 */

/////////////////////////// GLOBALS ////////////////////////////

import SimpleOpenNI.*;
SimpleOpenNI  kinect;
PImage img; // this will store our image data
boolean SHOW_DEPTH_IMG = true;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480);
  background(0);
  smooth();

  kinect = new SimpleOpenNI(this);  
  kinect.enableDepth(); // activate infra red cam

  kinect.enableUser(); // activate SimpleNI user data
  kinect.setMirror(true);
  // create & initialise image data
  img = createImage(width, height, RGB);
  img.loadPixels();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  
  kinect.update(); // always call this method
  PImage depthImage = kinect.depthImage(); // get depthImage data & store
  depthImage.loadPixels();

  int[] upix=kinect.userMap(); // get user data (pixel data)

  //Read pixel data and display images
  for (int i=0; i < upix.length; i++) {
    // If camera detects a user, colour him/her blue
    if (upix[i] > 0) {
      //NOTE: if you need to distinguish between users, check the value of the upix[i]
      img.pixels[i]=color(0, 0, 255);
    } 
    // ...otherwise we simply display the depthImage
    // NOTE: key 'd' activates depthImage/black background
    else {
      if (SHOW_DEPTH_IMG) {
        //add depth data to the image
        img.pixels[i]=depthImage.pixels[i];
      } else {
        //or just show black background
        img.pixels[i]=color(0, 0, 0);
      }
    }
  }
  img.updatePixels();

  //draws the image to screen
  image(img, 0, 0);
}

