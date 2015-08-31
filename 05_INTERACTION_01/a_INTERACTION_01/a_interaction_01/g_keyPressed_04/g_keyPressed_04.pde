///////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 DESIGNING PROGRAMS 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE CODING
 FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2010/11 
 www.freeartbureau.org/blog
 ++++++++++++++++++++++++++++++++++++++++++
 INTERACTION : CLAVIER
 SKETCH : KEYPRESSED_03
 PARENT SKETCH : KEYPRESSED_02
 TYPE : DYNAMIC

 */
/////////////////////////// GLOBALS ////////////////////////////

int dia;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  rectMode(CENTER);
  noStroke();
  dia = 200;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  ellipse(width/2, height/2, dia, dia);
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 'r') {
    fill(255, 0, 0);
  }
  if (key == 'w') {
    fill(255);
  }

  if (key == '+') {
    dia++;
  }
  
   if (key == '-') {
    dia--;
  }
}

