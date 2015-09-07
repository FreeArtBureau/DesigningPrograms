

/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////
import geomerative.*;
import processing.pdf.*;

RFont font;
RGroup myGroup;
RPoint[] myPoints;
FontAgent[] myVectors;
boolean freeze = false;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(880, 400);
  background(0);
  smooth();

  // Initialiser geomerative
  RG.init(this);
  RCommand.setSegmentLength(2);
  font = new RFont("Lato-Hairline.ttf", 173);
  myGroup = font.toGroup("t");
  myPoints = myGroup.getPoints();
  
  // Initialiser nos vecteurs
  myVectors = new FontAgent[myPoints.length];
  for (int i=0; i<myPoints.length;i++) {
    myVectors[i] = new FontAgent(myPoints[i].x, myPoints[i].y);
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  translate(73, height/1.7);

  for (int i=0; i<myPoints.length;i++) {

    myVectors[i].render();
//   myVectors[i].update();
//    myVectors[i].animate1();
    myVectors[i].animate2();
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 'f') freeze = !freeze;
  if (freeze)
    noLoop(); 
  else loop();
   if (key == 'r') {
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

