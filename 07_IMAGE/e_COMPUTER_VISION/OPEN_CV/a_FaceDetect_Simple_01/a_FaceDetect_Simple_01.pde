/*
 :::::::::::::::
 COMPUTER VISION
 :::::::::::::::
 
 > OPENCV
 Sketch : Face Detect
 Detects a face & does something ;–)
 
 - Keys
   'f' Show/Hide camera & detection
 */
/////////////////////////// GLOBALS ////////////////////////////
import gab.opencv.*;
import java.awt.*;
import processing.video.*;
Capture CAM;

OpenCV FACE_DETECT;
boolean SHOW_DETECT = false;
boolean TEXT_INTRO = false;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 380);
  background(0);
  smooth();
  PFont FONT; 
  // TEXTE
  fill(255);
  noStroke();
  FONT = createFont("Helvetica", 100);
  textFont(FONT, 100);
  textAlign(CENTER, CENTER);
  CAM = new Capture(this, 640/2, 480/2);
  // ADD FaceDetect
  FACE_DETECT = new OpenCV(this, 640/2, 480/2);
  FACE_DETECT.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  CAM.start(); 
}

void draw() {

  background(0);
  if (CAM.available() == true) {
    CAM.read();
    FACE_DETECT.loadImage(CAM); // assign camera to OpenCV object
  }
  
  // Detect for faces & add rectangle
  Rectangle[] faces = FACE_DETECT.detect();
  println(faces.length);

  if (faces.length >=1) {
    //FACE_DETECTED = true;
    TEXT_INTRO = true;
    if (TEXT_INTRO) {
      //textFont(FONT, 30);
      fill(255, 0, 255);
      text("BONJOUR !", width/2, height/2);
    }
  }
  
  ////////////////////////////////////////// SHOW FACEDETECT VIEWER
if (SHOW_DETECT) {
  image(CAM, 0, 0, CAM.width, CAM.height);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    // println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}
}


/////////////// KEYS
void keyPressed() {
  // SHOW FACE DETECT IMAGE
  if (key == 'f') {
    SHOW_DETECT = !SHOW_DETECT;
  }
}

