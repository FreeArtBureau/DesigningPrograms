/*
PLEASE READ INFO TAB

*/

/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;

RFont font;
RPoint[] mesPoints; 
String myText = "A"; // Change letter here

//////////////////////////////////////////////
void setup() {
  size(800,800);
  background(233);
  smooth();
  RG.init(this); 
  font = new RFont("AlteHaasGroteskBold.ttf", 500, CENTER);
  
  noFill();
  stroke(0,0,255);
  strokeCap(SQUARE);
  strokeWeight(0.3);
  translate(width/2, 600);

  RCommand.setSegmentLength(15);  
  RGroup maGroupe = font.toGroup(myText); 
  //maGroupe = maGroupe.toPolygonGroup();
  RPoint[] mesPoints = maGroupe.getPoints();
  
  for(int i=0; i<mesPoints.length; i++) {
     line(mesPoints[i].x, mesPoints[i].y,4,10);
    //line(mesPoints[i].x, mesPoints[i].y,30,-280);
   //line(mesPoints[i].x, mesPoints[i].y,20,mesPoints[i].y);
   //ellipse(mesPoints[i].x+10,mesPoints[i].y,3,3);
    
  }
}

//////////////////////////////////////////////
void draw() {
 
}
//////////////////////////////////////////////

