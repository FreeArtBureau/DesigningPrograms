///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org/blog
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : UNE TRAME
 SKETCH : MOTIF_03
 PARENT SKETCH : 
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

int trameRes = 20;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noFill();
  noLoop();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0);
  for (int gridY=2; gridY<trameRes-1; gridY++) {
    for (int gridX=2; gridX<trameRes-1; gridX++) {

      int posX = width/trameRes*gridX;
      int posY = height/trameRes*gridY;
      stroke(255);
      pushMatrix();
      translate(posX, posY);
      drawLines();
      popMatrix();
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void drawLines() {
  for (int i=0; i<30; i+=2) {
    strokeWeight(random(0.1, 2.7));
    line(-10+i, -10, -10+i, +10);
  }
}

