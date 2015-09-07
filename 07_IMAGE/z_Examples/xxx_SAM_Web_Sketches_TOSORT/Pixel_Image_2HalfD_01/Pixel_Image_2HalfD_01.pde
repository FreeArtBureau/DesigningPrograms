/*
PLEASE READ INFO TAB 
*/


/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
import peasy.*;

ControlP5 INTERFACES;
ControlWindow CW;

PeasyCam CAM;

// VARS CONTROLP5
float PIXFACT, FILTERFACT, COLFILTER;
boolean BG, REDFILTER, GREENFILTER, BLUEFILTER, STROKEB, 
TRISHAPE, QUADSHAPE, STRIP;

PImage IMG;
color COL;
int GRIDREZ;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  background(0);
  smooth();
  noFill();
  CAM = new PeasyCam(this, 800);
  //ControlInit();
  imageMode(CENTER);

  // Load image from disk : bug here > press ENTER to add file
  // otherwise interface prompts you twice
  //String IMGName = selectInput("Choose an image for S.A.M.");
  //if (IMGName!=null) {
    //IMG = loadImage(IMGName);
  //}
  //else {
    IMG = loadImage("first_drawing.jpg");
  //}
  size(IMG.width, IMG.height, P3D);
  ControlInit();  // init our ControlP5 interface
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if (BG) {
    background(0);
  }
  translate(-width/2.3, -height/2.3);

  // Vertex drawing modes
  if (TRISHAPE) {
    beginShape(TRIANGLES);
  }

  else if (QUADSHAPE) {
    beginShape(QUADS);
  }

  else if (STRIP) {
    beginShape(TRIANGLE_STRIP);
  }
  else {
    beginShape();
  }
  for (int y = 0; y <= IMG.height; y += GRIDREZ) {
    for (int x = 0; x <= IMG.width; x += GRIDREZ) {

      // Colour
      COL = IMG.get(x, y); // grab pixel colour
      float pixelBright = (brightness(COL)/255) * PIXFACT; // grab brightness

      if (REDFILTER) {
        COLFILTER = (red(COL)/255) * FILTERFACT; // grab red Pixels
      }

      if (GREENFILTER) {
        COLFILTER = (green(COL)/255) * FILTERFACT; // grab green Pixels
      }

      if (BLUEFILTER) {
        COLFILTER = (blue(COL)/255) * FILTERFACT; // grab blue Pixels
      }

      stroke(COL);
      
      // calculate Z depth for vertices based on brightness & colour filter
      float zDepth = pixelBright + (pixelBright * COLFILTER);
      if (STROKEB) {
        float strokeBrightness = (brightness(COL)/255) * 1.3;
        strokeWeight(strokeBrightness);
      }
      else {
        strokeWeight(1);
      }
      vertex(x, y, zDepth);
    }
  }
  endShape();
}



