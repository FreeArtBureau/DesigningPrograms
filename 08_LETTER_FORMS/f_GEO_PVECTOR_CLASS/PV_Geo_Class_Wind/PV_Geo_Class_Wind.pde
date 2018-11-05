/*
PLEASE READ INFO TAB
 */


/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;
RFont a;
RGroup grp;
RPoint[] pnts;
FontAgent[] vec;
boolean freeze = false;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(700, 500);
  background(0);
  smooth();

  RG.init(this);
  RCommand.setSegmentLength(1);
  a = new RFont("AlteHaasGroteskBold.ttf", 130);
  grp = a.toGroup("painting");
  pnts = grp.getPoints();
  fill(255);

  vec = new FontAgent[pnts.length];
  for (int i=0; i<pnts.length;i++) {
    vec[i] = new FontAgent(pnts[i].x, pnts[i].y, random(1, 50));
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  translate(100, height/2.1);

  // Create a new force called gravity.
  PVector gravity = new PVector(0, 0.0202);

  for (int i=0; i<pnts.length;i++) {
    vec[i].drawVectors();
    vec[i].applyForce(gravity);
  }

  // When mouse is pressed
  // Create a new force called wind
  // & apply it
  if (mousePressed) {
    PVector wind = new PVector(0, -0.3);
    for (int i=0; i<pnts.length;i++) {
      vec[i].applyForce(wind);
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 'f') freeze = !freeze;
  if (freeze)
    noLoop(); 
  else loop();
}