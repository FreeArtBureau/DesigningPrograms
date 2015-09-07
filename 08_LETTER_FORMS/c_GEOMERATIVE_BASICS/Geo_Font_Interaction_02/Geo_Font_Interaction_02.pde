

/* NOTE !!! Dans ce sketch, on peut changer de charactère directement avec le clavier */
/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;
import processing.pdf.*;
boolean PDFSAVE = false;

RFont font;
RPoint[] myPoints;
char myText = 'G';
int pntsEnd;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(600, 600);
  background(233);
  smooth();
  RG.init(this); 
  font = new RFont("AlteHaasGroteskBold.ttf", 600, CENTER);
  pntsEnd = 15;
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(255);
  if (PDFSAVE) beginRecord(PDF,"exportPDF_###.pdf");
  // Position de notre texte 
  translate(width/2.3, height/1.2);

  // interaction avec la souris sur l'axe X & Y
  int pntsEnd = (int)map(mouseY, 0, height, 1, 50); // taille de nos ellipses
  float seg = map(mouseX, 0, width, 1.0, 20.0); // fréquence de points

  // dessiner notre countour
  RCommand.setSegmentLength(seg);
  // NOTE ! Here we create a new String with myText as value.
  // myText is a char and needs casting. Value is updated with keypressed !
  String letter = Character.toString(myText);
  RGroup myGroup = font.toGroup(letter);
  
  RPoint[] myPoints = myGroup.getPoints();

  for (int i=0; i<myPoints.length-pntsEnd; i++) {
    // Attributs de la forme    
    stroke(0, 0, 255);
    noFill();
    strokeWeight(0.5);
    line(myPoints[i].x, myPoints[i].y, myPoints[i+pntsEnd].x, myPoints[i+pntsEnd].y);
  }
  if (PDFSAVE) {
    PDFSAVE = !PDFSAVE;
    endRecord();
  }
  println(seg);
   println(pntsEnd);
}

//////////////////////////////////////////////
void keyPressed() {
  if (keyCode == ALT) {
    PDFSAVE = true;
  }
  // update letter with keyboard
  myText = key;
}

