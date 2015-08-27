///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : FONCTIONS
 SKETCH : CHOSEBIZARRE_04
 PARENT SKETCH : CHOSEBIZARRE_03
 TYPE : STATIQUE
 */

/////////////////////////// GLOBALS ////////////////////////////

//////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke();

  for (int xPos=50; xPos<width; xPos+=50) {
    for (int yPos=50; yPos<height; yPos+=50) {     
      color randCol = color(random(255), random(255), random(255));
      choseBizarre(xPos, yPos, 5, randCol);
    }
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////
// On a rajouté un troisième argument pour définir la taille
void choseBizarre(float _x, float _y, int size, color c) {

  fill(c);
  // On a besoin de push & popMatrix pour éviter de cumuler les translations.
  pushMatrix();
  translate(_x, _y); // ensuite, on utilise ces arguments pour positionner les formes

  // Notez bien l'attribution de notre argument 'size' ici !
  scale(size);
  ellipse(0, 0, 10, 5);
  ellipse(0, 0, 5, 10);
  popMatrix();
}

