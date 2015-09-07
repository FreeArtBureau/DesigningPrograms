/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////
import geomerative.*;

RFont a;
RGroup grp;
RPoint[] pnts;
FontAgent[] vec;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 400);
  background(0);
  smooth();
 
  RG.init(this);
  RCommand.setSegmentLength(2);
  a = new RFont("AlteHaasGroteskBold.ttf",130);
  grp = a.toGroup("PAINT");
  pnts = grp.getPoints();
  fill(255);
  vec = new FontAgent[pnts.length];
   for(int i=0; i<pnts.length;i++) {
    vec[i] = new FontAgent(pnts[i].x, pnts[i].y); 
   }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  translate(100,height/2); 
  for(int i=0; i<pnts.length;i++) {
    vec[i].render();
    vec[i].update();
  }

}

/////////////////////////// FUNCTIONS ////////////////////////////

