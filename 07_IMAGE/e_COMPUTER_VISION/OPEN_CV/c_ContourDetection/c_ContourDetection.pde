/*
 :::::::::::::::
 COMPUTER VISION
 :::::::::::::::
 
 > OPENCV
 Sketch : Contour Detect
 Detects contours of shapes
 Also demonstrates how blur & threshold have an effect 
 on the precision of contours 
 
 - Keys
   'p' Show/Hide approximated contours as polygons
   '+' & '-' change video threshold filter
   'b' & 'n' change blur factor
 */

/////////////////////////// GLOBALS ////////////////////////////

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
PImage dst;
OpenCV opencv;
boolean POLYGON = false;
int THRESH = 53;
int BLURFACT = 1;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480);
  smooth();
  dst = new PImage();
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  //opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);    
  video.start();

  noFill();
  stroke(0, 255, 0);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  scale(2);
  opencv.loadImage(video);

  dst = video;
  //opencv.gray();
  opencv.blur(BLURFACT);
  opencv.threshold( THRESH );
  dst = opencv.getOutput();

  contours = opencv.findContours();
  image(dst, 0, 0 );

  for (Contour contour : contours) {
    stroke(0, 255, 0);
    contour.draw();

    if (POLYGON) {
      stroke(255, 0, 0);
      beginShape(POINTS);
      for (PVector point : contour.getPolygonApproximation().getPoints()) {
        vertex(point.x, point.y);
      }
      endShape();
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {

  if (key == 'p') {
    POLYGON = !POLYGON;
  }
  if (key == '+') {
    THRESH ++;
  }
  if (key == '-') {
    THRESH--;
  }
  
  if(key == 'b') {
   BLURFACT++; 
  }
  
   if(key == 'n') {
   BLURFACT--; 
  }
}

void captureEvent(Capture c) {
  c.read();
}

