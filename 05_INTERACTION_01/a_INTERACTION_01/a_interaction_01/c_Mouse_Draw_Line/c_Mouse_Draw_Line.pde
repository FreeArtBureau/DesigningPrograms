///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 1.0
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 INTERACTION : SOURIS
 SKETCH : MOUSE_DRAW_LINE
 PARENT SKETCH : MOUSE_PRESSED_01
 TYPE : DYNAMIQUE
 */

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  stroke(255);
  background(0);
  smooth();
  noFill();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if (mousePressed == true) {
    line( mouseX, mouseY, pmouseX, pmouseY);
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

