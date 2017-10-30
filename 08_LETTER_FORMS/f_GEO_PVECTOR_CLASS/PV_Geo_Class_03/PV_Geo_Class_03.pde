/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////
import geomerative.*;
import processing.pdf.*;
boolean PDFSAVE = false;

RFont a;
RGroup grp;
RPoint[] pnts;
FontAgent[] vec;
boolean freeze = false;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(1100, 400);
  background(0);
  smooth();

  // Initialiser geomerative
  RG.init(this);
  RCommand.setSegmentLength(1);
  a = new RFont("AlteHaasGroteskBold.ttf", 200);
  grp = a.toGroup("GROWTH");
  pnts = grp.getPoints();

  // Initialiser nos vecteurs
  vec = new FontAgent[pnts.length];
  for (int i=0; i<pnts.length;i++) {
    vec[i] = new FontAgent(pnts[i].x, pnts[i].y);
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  translate(100, height/1.5);

  for (int i=0; i<pnts.length;i++) {

    vec[i].render();
    vec[i].timer();
    //vec[i].update(); // does what ?
   //vec[i].animate1();
   //vec[i].animate2();
   vec[i].animate3();
  }

}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 'f') freeze = !freeze;
  if (freeze)
    noLoop();
  else loop();

    if (key == 'e' || key == 'E') {
     beginRecord(PDF, "PDF_Export_###.pdf");
  }

      if (key == 'r' || key == 'R') {
     endRecord();
    println("FINITO!");
  }

}
