
/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;

////////////////////////// GLOBALS //////////////////////////////

RShape maForme;
////////////////////////// SET UP //////////////////////////////

void setup() {
  size(1200, 700);
  smooth();
  RG.init(this);
  maForme = RG.loadShape("text_01b.svg");
  maForme = RG.centerIn(maForme, g, 75);
}

////////////////////////// DRAW //////////////////////////////

void draw() {
  background(0);
  noStroke();
  fill(255);

  translate(width/2, height/2);

  RCommand.setSegmentLength(2);
  RPoint[] pnts = maForme.getPoints();

  for ( int i = 1; i < pnts.length; i++ ) {
    ellipse(pnts[i].x, pnts[i].y, 1, 1);
  }

}


