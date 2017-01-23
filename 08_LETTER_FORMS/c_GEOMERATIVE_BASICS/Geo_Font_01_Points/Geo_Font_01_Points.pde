/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;

RFont font;
RPoint[] myPoints;
String myText = "GEOMERATIVE";

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(850, 300);
  background(233);
  smooth();
  RG.init(this); 
  font = new RFont("FreeSans.ttf", 100, CENTER);

  fill(0, 0, 255);
  noStroke();
  translate(width/2, height/1.8);

  //CONFIGURE SEGMENT LENGTH AND MODE
  RCommand.setSegmentLength(2);
  //GROUP TOGETHER MY FONT & TEXT.
  RGroup myGroup = font.toGroup(myText);  
  //ACCESS POINTS ON MY FONT/SHAPE OUTLINE
  RPoint[] myPoints = myGroup.getPoints();

  //DRAW ELLIPSES AT EACH OF THESE POINTS
  for (int i=0; i<myPoints.length; i++) {
    ellipse(myPoints[i].x, myPoints[i].y, 1, 1);
  }
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
}

//////////////////////////////////////////////