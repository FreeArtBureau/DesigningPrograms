/*
PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
ControlP5 INTERFACES;
//ControlWindow CW;

PImage IMG;
float R, G, B, H;
int IMGINDEX, INDEXRED, INDEXGREEN, INDEXBLUE, 
TRAMEX, TRAMEY;
boolean GIFJUICE;
float FRAMES, COUNT;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(255);
  smooth();
  ControlInit();
  noStroke();
  // Load image from disk : bug here > press ENTER to add file
  // otherwise interface prompts you twice
  /*String IMGName = selectInput("Choose an image for S.A.M.");
   if (IMGName!=null) {
   IMG = loadImage(IMGName);
   } else {
   */
  IMG = loadImage("Ball_01.jpg");
  //}
  size(IMG.width, IMG.height, P2D);
  FRAMES = 12;
  COUNT = 0;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  loadPixels();
  noStroke();
  //indexHUE = (int)map(mouseX, 0, width, 1, 50);
  for (int y=0; y<IMG.height-1; y+=TRAMEY) {
    for (int x=0; x<IMG.width-1; x+=TRAMEX) {
      // Calculate image pixel array index position based on image size
      IMGINDEX = y * IMG.width + x; 

      // Update colour pixels
      R = red(IMG.pixels[ IMGINDEX + INDEXRED ]);
      G = green(IMG.pixels[ IMGINDEX + INDEXGREEN ]);
      B = blue(IMG.pixels[ IMGINDEX + INDEXBLUE ]);
      fill(R, G, B);
      rect(x, y, TRAMEX, TRAMEY);
    }
  }
  updatePixels();
  if (GIFJUICE) {
    exportGIF();
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's') {
    save("normal_###.png");
    SaveHiRes(2);
    exit();
  }
  if (key == 'j') {
    GIFJUICE = !GIFJUICE;
  }
}

void SaveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, P2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires_###.png");
}

void exportGIF() {
  saveFrame("frame_"+COUNT+".png"); 
  COUNT++;
  INDEXRED+=5;
  INDEXGREEN -=2;
  INDEXBLUE+=2;
  if (COUNT > FRAMES) {
    println("GifJuice Export!");
    GIFJUICE = !GIFJUICE;
    // COUNT = 0; // Need to find a place to put this.
    //exit();
  }
}


