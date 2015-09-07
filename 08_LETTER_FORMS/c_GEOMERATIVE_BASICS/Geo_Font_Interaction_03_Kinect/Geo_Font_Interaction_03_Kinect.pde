


/////////////////////////// GLOBALS ////////////////////////////

import processing.opengl.*;
import SimpleOpenNI.*;
import geomerative.*;

SimpleOpenNI kinect;
RFont font;
RPoint[] myPoints;
String myText = "PLAY";
int pntsEnd;
float depthTxt;
int boxSize = 150;
PVector boxCenter = new PVector(0, 0, 1000);

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(1100, 900, OPENGL);
  background(0);
  smooth();
  frameRate(30);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  RG.init(this); 
  font = new RFont("AlteHaasGroteskBold.ttf", 200, CENTER);
  pntsEnd = 15;
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  kinect.update();

  // Position de notre texte 
  translate(width/2, height/2, -800);

  PVector[] depthPoints = kinect.depthMapRealWorld();
  // initialize a variable
  // for storing the total
  // points we find inside the box
  // on this frame
  int depthPointsInBox = 0;

  for (int i = 0; i < depthPoints.length; i+=10) {
    PVector currentPoint = depthPoints[i];

    if (currentPoint.x > boxCenter.x - boxSize/2 && currentPoint.x < boxCenter.x + boxSize/2) {
      if (currentPoint.y > boxCenter.y - boxSize/2 && currentPoint.y < boxCenter.y + boxSize/2) {
        if (currentPoint.z > boxCenter.z - boxSize/2 && currentPoint.z < boxCenter.z + boxSize/2) {
          depthPointsInBox++;
        }
      }
    }

    // point(currentPoint.x, currentPoint.y, currentPoint.z);
  }
  translate(boxCenter.x, boxCenter.y, boxCenter.z);

  int pntsEnd = (int)map(depthPointsInBox, 0, 300, 1, 50); // taille de nos ellipses
  depthTxt = map(depthPointsInBox, 0, 30, 2, 10); // fréquence de points

  // dessiner notre countour
  RCommand.setSegmentLength(depthTxt);
  RGroup myGroup = font.toGroup(myText);  
  RPoint[] myPoints = myGroup.getPoints();

  for (int i=0; i<myPoints.length-pntsEnd; i++) {
    // Attributs de la forme    
    stroke(255,150);
    noFill();
    strokeWeight(0.5);
    line(myPoints[i].x, myPoints[i].y, myPoints[i+pntsEnd].x, myPoints[i+pntsEnd].y);
  }
}


//////////////////////////////////////////////

