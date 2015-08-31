///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 DESIGNING PROGRAMS 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE CODING
 FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2010/11 
 www.freeartbureau.org/blog
 ++++++++++++++++++++++++++++++++++++++++++
 INERACTION : MOUSE & KEY
 SKETCH : RANDOM_CIRLCES_MOUSE
 PARENT SKETCH : NONE
 TYPE : DYNAMIC

 */

/////////////////////////// GLOBALS ////////////////////////////
int posX, posY;
int distance;
int dia;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(700, 400);
  frameRate(10);
  background(0);
  smooth();
  noFill();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  ellipse(posX, posY, dia, dia);
  dia+=distance/5;
}

/////////////////////////// FUNCTIONS ////////////////////////////
void mousePressed() {
  stroke(255);
  dia = (int)random(1, 10);
  distance = int(random(10, 80));
  posX = mouseX;
  posY = mouseY;
}

void keyPressed() {
  if (key == DELETE || key == BACKSPACE) {
    background(0);
    dia = 0;
  }
  if (key == 's') {
    save("monImage_####.tiff");
  }
}

