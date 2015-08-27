///////////////////////////////////////
/* ++++++++++++++++++++++++++++++++++++++++++
 DESIGNING PROGRAMS 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE CODING
 FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : REPETITION
 SKETCH : SUPERTRAME
 PARENT SKETCH : NONE
 TYPE : DYNAMIC
 
 SUGGESTIONS :
 
 */

/////////////////////////// GLOBALS ////////////////////////////
float xPas = 10;
float yPas = 10;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 400);
  background(0);
  smooth();
  noStroke();
  fill(255);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  translate(width/2, height/2);
  
  float dia2 = map(mouseY, 0, height, 1, 10);
  trame(dia2);

  rotate(mouseX*0.05);
  trame(dia2);

}

/////////////////////////// FUNCTIONS ////////////////////////////

void trame(float dia) {
  for (int posX=-width/2*2; posX<=width-50; posX+=xPas) {
    for (int posY=-height/2*2; posY<=height-50; posY+=yPas) {
      ellipse(posX, posY, dia, dia);
    }
  }
}

