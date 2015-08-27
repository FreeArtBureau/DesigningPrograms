///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : FONCTIONS
 SKETCH : STAR
 PARENT SKETCH : NONE
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
    translate(100,100);
    star();
}

/////////////////////////// FUNCTIONS ////////////////////////////
void star() {
  line(-15, -15, 15, 15);
  line(15, -15, -15, 15);
  line(-15, 0, 15, 0);
  line(0, -15, 0, 15);
}
