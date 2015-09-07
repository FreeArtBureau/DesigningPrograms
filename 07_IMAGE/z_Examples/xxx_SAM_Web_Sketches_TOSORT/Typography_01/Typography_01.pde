
/*
PLEASE READ INFO TAB 
 */

/////////////////////////// GLOBALS ////////////////////////////
import geomerative.*;
import processing.pdf.*;

RFont FONT;
RGroup GRP;
RPoint[] PNTS;
FontAgent[] VEC;
boolean FREEZE = false;
color[] MYCOLOURS = {
  //#31515C, #F5EBE1, #A69B8D, #261B17, #0D0D0D, #584359, #4CB8A4, #381C36, #7A4D24
  #381C36, #7A4D24, #B89333, #A6C73C, #335E4D
};

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(900, 560);
  background(255);
  smooth();

  // Initialise geomerative
  RG.init(this);
  RCommand.setSegmentLength(6);
  FONT = new RFont("Lato-Hairline.ttf", 300);
  GRP = FONT.toGroup("SAM");
  PNTS = GRP.getPoints();

  // Initialise our vectors
  VEC = new FontAgent[PNTS.length];
  for (int i=0; i<PNTS.length;i++) {
    VEC[i] = new FontAgent(PNTS[i].x, PNTS[i].y);
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  translate(73, height/1.6);
  smooth();
  for (int i=0; i<PNTS.length;i++) {

    VEC[i].Render();
    //VEC[i].Rpdate();
    //VEC[i].Animate1();
    VEC[i].Animate2();
    VEC[i].Animate3();
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 'f') FREEZE = !FREEZE;
  if (FREEZE)
    noLoop(); 
  else loop();

  if (key == 'q') {
    setup();
  }
  if (key == 'b') {
    beginRecord(PDF, "Export_###.pdf");
  }

  if (key == 'e') {
    endRecord(); 
    println("DONE");
  }
  if (key == 's') {
    saveFrame("Capture_###.png");
  }
}

