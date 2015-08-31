///////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 DESIGNING PROGRAMS 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE CODING
 FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2010/11 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 INTERACTION : CLAVIER
 SKETCH : KEYPRESSED_02
 PARENT SKETCH : KEYPRESSED_01
 TYPE : DYNAMIC
 
 */
/////////////////////////// GLOBALS ////////////////////////////

color myc;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  rectMode(CENTER);
  noStroke();
  myc = color(255, 0, 0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

  fill(myc);
  rect(width/2, height/2, 200, 200);
}

/////////////////////////// FUNCTIONS ////////////////////////////


void keyPressed() {
  if (key == 'r') {
    myc = color(255, 0, 0);
  }

  if (key == 'g') {
    myc = color(0, 255, 0);
  }

  if (key == 'b') {
    myc = color(0, 0, 255);
  }
}

