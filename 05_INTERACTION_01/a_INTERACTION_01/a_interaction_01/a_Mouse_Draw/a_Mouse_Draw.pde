///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2010/11 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : INTERACTION_01
 SKETCH : MOUSE_DRAW
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(400, 300);
  background(0);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();
}
/////////////////////////// DRAW ////////////////////////////

void draw() {

  // (frameCount*0.5)%360 cycles repeatedly through hues from 0 to 360
  fill((frameCount*0.5)%360, 100, 100);

  ellipse(mouseX, mouseY, 10, 10);
}

/////////////////////////// FUNCTIONS ////////////////////////////

