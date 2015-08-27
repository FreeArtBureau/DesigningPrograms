///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : FONCTIONS
 SKETCH : CHOSEBIZARRE
 PARENT SKETCH : NONE
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

//////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke();
  
  translate(200,200);// On positionne notre forme avec translate(x,y).
  choseBizarre();//Ici, on appele notre fonction.

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////
// Nous créons ici notre fonction en utilisant le mot void
// et en lui donnant un mot-clé (choseBizarre). 
void choseBizarre() {
  fill(255);
  ellipse(0, 0, 100, 50);
  ellipse(0, 0, 50, 100);
}

