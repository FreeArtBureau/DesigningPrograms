/* 
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : CUSTOM SHAPES
 SKETCH : CUSTOMSHAPE_01
 PARENT SKETCH : 
 TYPE : STATIQUE
*/

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  stroke(255);
  strokeWeight(5);
  noFill();
  
  // On peut définir nos propres formes avec des vertex
  // c'est-à-dire des points dans l'espace.
  // On écrit ces vertex entre beginShape()  &  endShape()
  // et Processing relie ces points avec des lignes
  
  // LIRE : https://processing.org/reference/beginShape_.html
  beginShape();
  
  vertex(100,100);
  vertex(300,100);
  vertex(200,300);
  
  endShape(CLOSE);

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
 
}


/////////////////////////// FUNCTIONS ////////////////////////////

