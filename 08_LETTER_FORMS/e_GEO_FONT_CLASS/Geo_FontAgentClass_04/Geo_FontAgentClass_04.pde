/*
PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////


import geomerative.*;

RPoint[] myPoints;
FontAgent[] myFontAgents;
boolean stopAnime = false;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(900, 400);
  background(0); 
  strokeWeight(0.3);
  smooth();
  String myText = "DEFORM";

  RG.init(this);
  RFont myFont = new RFont("FreeSans.ttf", 145, RFont.CENTER);
  RCommand.setSegmentLength(5);
  RGroup myGroup = myFont.toGroup(myText);
  myPoints = myGroup.getPoints();

  myFontAgents = new FontAgent[myPoints.length];
  for (int i=0; i<myPoints.length; i++) {
    myFontAgents[i] = new FontAgent(myPoints[i].x, myPoints[i].y);
  }
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0,150);
  fill(0,33);
  rect(0,0,width,height);
  translate(width/2, 250);

  for (int i=0; i<myPoints.length; i++) {
    myFontAgents[i].animate1();
    myFontAgents[i].render();
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
  if (key == 'f' || key == 'F') 
  stopAnime = !stopAnime;
  if(stopAnime == true)
    noLoop();
    else loop();
    

}

