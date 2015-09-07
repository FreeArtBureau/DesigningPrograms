/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////
import geomerative.*;

RFont font;
RGroup myGroup;
RPoint[] myPoints;
FontAgent[] myVectors;
boolean freeze = false;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(720, 360);
  background(0);
  smooth();

  // Initialiser geomerative
  RG.init(this);
  RCommand.setSegmentLength(5);
  font = new RFont("AlteHaasGroteskBold.ttf", 173);
  myGroup = font.toGroup("HELLO");
  myPoints = myGroup.getPoints();
  
  // Initialiser nos vecteurs
  myVectors = new FontAgent[myPoints.length];
  for (int i=0; i<myPoints.length;i++) {
    myVectors[i] = new FontAgent(myPoints[i].x, myPoints[i].y);
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  translate(100, height/1.7);

  for (int i=0; i<myPoints.length;i++) {

    myVectors[i].render();
    myVectors[i].update();
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 'f') freeze = !freeze;
  if (freeze)
    noLoop(); 
  else loop();
}

