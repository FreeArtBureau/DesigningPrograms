/*
PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////


import geomerative.*;

RPoint[] myPoints;
FontAgent[] myFontAgents;
boolean stopAnime = false;
boolean ROTATE = false;


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(900, 400);
  background(255); 
  strokeWeight(0.3);
  smooth();
  String myText = "LINES";

  RG.init(this);
  RFont myFont = new RFont("FreeSans.ttf", 195, RFont.CENTER);
  RCommand.setSegmentLength(7);
  RGroup myGroup = myFont.toGroup(myText);
  myPoints = myGroup.getPoints();

  myFontAgents = new FontAgent[myPoints.length];
  for (int i=0; i<myPoints.length; i++) {
    myFontAgents[i] = new FontAgent(myPoints[i].x, myPoints[i].y);
  }
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  translate(width/2, 250);
  // var for rotation angle if rotate is activated
  // Press key 'r' to activate rotation
  float rotate = map(mouseY, 0, height, 0, radians(360));

  // var for effect scale
  float nAmm = map(mouseX, 0, width, 1, 200);

  for (int i=0; i<myPoints.length; i++) {
    myFontAgents[i].animate1(nAmm);
    myFontAgents[i].render();

    if (ROTATE) {
      myFontAgents[i].angle = rotate;
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
  if (key == 'f' || key == 'F') {
    stopAnime = !stopAnime;//Check what ! does.

    if (stopAnime == true)
      noLoop();
    else loop();
  }

  if (key == 'r') {
    ROTATE = !ROTATE;
  }
}

