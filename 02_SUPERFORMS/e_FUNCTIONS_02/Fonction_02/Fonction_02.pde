///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : FONCTIONS
 SKETCH : FONCTION_02
 PARENT SKETCH : FONCTION_01
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  stroke(255);
  strokeWeight(1);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  for (int xPos=0; xPos<width; xPos+=30) {
    for (int yPos=0; yPos<height; yPos+=30) {
      pushMatrix();
      translate(xPos, yPos);
      star();
      popMatrix();
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void star() {
  line(-15, -15, 15, 15);
  line(15, -15, -15, 15);
  line(-15, 0, 15, 0);
  line(0, -15, 0, 15);
}

