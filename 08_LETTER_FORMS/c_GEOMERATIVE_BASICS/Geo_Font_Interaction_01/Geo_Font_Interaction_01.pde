/*
 SKETCH : GEO_FONT_INTERACTION_01
 PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;

RFont font;
RPoint[] myPoints;
String myText = "Points on Outline";

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(850, 300);
  background(233);
  smooth();
  RG.init(this); 
  font = new RFont("FreeSans.ttf", 100, CENTER);
 
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(255);
 // Position de notre texte 
  translate(width/2, height/2);

 // Attributs de la forme    
  fill(0, 0, 255, 73);
  noStroke();
  
  // interaction avec la souris sur l'axe X & Y
  float dia = map(mouseY, 0, height, 1.0, 30.0); // taille de nos ellipses
  float seg = map(mouseX,0,width,1.0,20.0); // fréquence de points
  
  // dessiner notre countour
  RCommand.setSegmentLength(seg);
  RGroup myGroup = font.toGroup(myText);  
  RPoint[] myPoints = myGroup.getPoints();

  for (int i=0; i<myPoints.length; i++) {
    ellipse(myPoints[i].x, myPoints[i].y, dia, dia);
  }
}

//////////////////////////////////////////////

