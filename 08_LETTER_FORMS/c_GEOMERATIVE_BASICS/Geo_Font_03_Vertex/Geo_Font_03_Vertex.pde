
/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;
import processing.pdf.*;
boolean PDFSAVE = false;

RFont font;
RPoint[] mesPoints; 
String myText = "N";

//////////////////////////////////////////////
void setup() {
  size(600, 460);
  background(255);
  smooth();
  RG.init(this); 
  font = new RFont("AlteHaasGroteskBold.ttf", 350, CENTER);
}

//////////////////////////////////////////////
void draw() {
  background(255);
  if (PDFSAVE) beginRecord(PDF, "PDF_Export_###.pdf");
  noFill();
  stroke(0);
  strokeCap(SQUARE);

  translate(width/2.2, height/1.3);

  float segLen = map(mouseX, 0, width, 1, 350);
  RCommand.setSegmentLength(segLen);  
  RGroup maGroupe = font.toGroup(myText); 
  RPoint[] mesPoints = maGroupe.getPoints();

  float mY = map(mouseY, 0, height, -900, 100);

  beginShape();
  strokeWeight(1.3);
  for (int i=0; i<mesPoints.length; i++) {
    vertex(mesPoints[i].x, mesPoints[i].y);

  }
  endShape(CLOSE);

  beginShape();
    noStroke();
    fill(0,0,255,150);
  for (int i=0; i<mesPoints.length; i++) {
    vertex(mesPoints[i].x+12, mesPoints[i].y+12);

  }
  endShape();
  
    if (PDFSAVE) {
    PDFSAVE = !PDFSAVE;
    endRecord();
    println("FINITO!");
  }
}
//////////////////////////////////////////////
void keyPressed() {

  if (key == 'e' || key == 'E') {

    PDFSAVE = true;
  }
}