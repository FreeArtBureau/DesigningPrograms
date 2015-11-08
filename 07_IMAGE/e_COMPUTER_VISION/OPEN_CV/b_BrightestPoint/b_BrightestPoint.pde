/*
 :::::::::::::::
 COMPUTER VISION
 :::::::::::::::
 
 > OPENCV
 Sketch : Brightest Point
 Drawing with the hand & with the computer camera
 
 - Keys
   'v' Show/Hide camera
 */

///////////////////////////////// GLOBALS

import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture video;
boolean SHOW_VIDEO = true;

float lastX;
float lastY;
float interPolationFact = 0.5f;
///////////////////////////////// SETUP

void setup() {
  background(0);
  video = new Capture(this, 640, 480);
  video.start();
  size(video.width, video.height);
  opencv = new OpenCV(this, 640, 480);
}

///////////////////////////////// DRAW

void draw() {
  //image(video, 0, 0); 
  // Assign cam video to openCV
  opencv.loadImage(video);


  if (SHOW_VIDEO) {
    // get output from OpenCV
    image(opencv.getOutput(), 0, 0);
    //background(0);
  } else {
    opencv.getOutput();
  }

  // Get max/min (brightness) value 
  PVector loc1 = opencv.min();
  PVector loc2 = opencv.max();

  stroke(255, 0, 0);
  strokeWeight(4);
  noFill();
  // ellipse(loc2.x, loc2.y, 10, 10);

  // INTERPOLATION > Gives smoother results
  float interpolatedX = lerp(lastX, loc2.x, interPolationFact); 
  float interpolatedY = lerp(lastY, loc2.y, interPolationFact);

  line(lastX, lastY, interpolatedX, interpolatedY); 
  lastX = interpolatedX;
  lastY = interpolatedY;
}

///////////////////////////////// FUNCTIONS
//VIDEO FUNCTIONS
void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {

  if (key == 'v') {
    background(0);
    SHOW_VIDEO = !SHOW_VIDEO;
  }
}

