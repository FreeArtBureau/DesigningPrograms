///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 INTERACTION : CLAVIER
 SKETCH : KEYPRESSED_03
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 */

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  noStroke();
  smooth();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0);
  if (mousePressed == true) {
    ellipse(mouseX, mouseY, 10, 10);
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's')
  saveFrame("monImage.png");
  println("Saved Image ;––)");
}

