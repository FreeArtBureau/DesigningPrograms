// TINY STOP-FRAME PROGRAM
// Saves an image from the camera when a key/mouse is pressed.
// Written by Golan Levin : http://www.flong.com/
 
//----------------------------------------------------------
// Parameters you can modify:
int videoWidth  = 320; // could be 160, 320, 640, etc.
int videoHeight = 240; // could be 120, 240, 480, etc.
int onionSkinTransparency = 127; // between 0 and 255
 
//----------------------------------------------------------
import  processing.video.*;
PImage  previousImage;
Capture myCapture;
int     saveCount = 0;
boolean bDoSave = false;
 
//----------------------------------------------------------
void settings(){
   myCapture = new Capture(this, videoWidth,videoHeight);
  size(myCapture.width,myCapture.height); 
}
void setup(){
  previousImage = new PImage(myCapture.width,myCapture.height);
  myCapture.start();
}
 
//----------------------------------------------------------
void keyPressed(){
  bDoSave = true;
}
void mousePressed(){
  bDoSave = true;
}
 
//----------------------------------------------------------
void draw() {
  if(myCapture.available()) {
    myCapture.read();
 
    if (bDoSave){
      noTint();
      image(myCapture, 0,0); 
 
      String filename = "stopframe_" + nf(saveCount++, 5) + ".jpg";
      saveFrame(filename);
      bDoSave = false;
 
      previousImage.loadPixels();
      arrayCopy (myCapture.pixels, previousImage.pixels);
      previousImage.updatePixels();
    }
    else {
      noTint();
      image(previousImage, 0,0);
      tint(255, 255, 255, onionSkinTransparency);
      image(myCapture, 0,0);
    }
  }
}