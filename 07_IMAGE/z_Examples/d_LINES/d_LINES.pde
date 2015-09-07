///////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 GRAPHIC SYSTEMS 1.0 (2014)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2013 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 FUNDAMENTALS : IMAGE
 SKETCH : LINES_
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 
 **NB
 
 */

PImage trees;
int y = 0;

void setup() {
  size(800, 300, P2D);
  trees = loadImage("textures.jpg");
}

void draw() {
  image(trees, 0, 0);
  y = constrain(mouseY, 0, 300);
  for (int i = 0; i < 400; i++) {
    color c = get(i, y);
    stroke(c);
    line(i + 400, 0, i + 400, 400);
  }
  stroke(255);
  line(0, y, 400, y);
}

