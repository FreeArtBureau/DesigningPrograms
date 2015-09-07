/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;

RFont font;
PShape maForme;//DECLARATION D'UNE NOUVELLE FORME
PShape maForme2;
String myText = "SHAPE";

//////////////////////////////////////////////
void setup() {
  size(800, 400);
  background(0);
  smooth();
  RG.init(this); 
  font = new RFont("AlteHaasGroteskBold.ttf", 193, CENTER);
  // NOTE ! Changer de SVG ! Le mien est très moche !
  maForme = loadShape("forme_003.svg");//CHARGER LA FORME
  maForme2 = loadShape("forme_000.svg");
  maForme2.disableStyle();
  maForme.disableStyle();
  shapeMode(CENTER);
}

//////////////////////////////////////////////
void draw() {
  background(0);

  translate(width/2, height/1.6);

  // Attributs de la forme    
  noStroke();
  //strokeWeight(0.7);
  fill(255, 123);

  // interaction avec la souris sur l'axe X & Y
  float maFormeTaille = map(mouseY, 0, height, 10, 80);
  //float SegLength = map(mouseX, 0, width, 50, 0);
  float angle = map(mouseX, 0, width, 0, radians(360));

  // dessiner notre countour
  RCommand.setSegmentLength(16);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RGroup maGroupe = font.toGroup(myText); 
  RPoint[] mesPoints = maGroupe.getPoints();

  for (int i=0; i<mesPoints.length; i++) {
    //AFFICHER LA FORME
    pushMatrix();
    translate(mesPoints[i].x, mesPoints[i].y);
    
    if (i%2==0) {
      rotate(angle);
      shape(maForme, 0, 0, maFormeTaille, maFormeTaille);
    } else {

      shape(maForme2, 0, 0, maFormeTaille, maFormeTaille);
    }
    popMatrix();
  }
}
//////////////////////////////////////////////

