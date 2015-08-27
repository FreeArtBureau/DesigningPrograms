///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : UNE TRAME
 SKETCH : TRAME_01
 PARENT SKETCH : NONE
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

int trameRes = 20; // Résolution de notre trame (x & y)
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  fill(255);
  noStroke();
  noLoop();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

  // Notez bien les valeurs pour les boucles FOR
  // Il s'agit d'une autre manière de dessiner une trame
  for (int gridY = 1; gridY < trameRes; gridY++) {
    for (int gridX = 1;  gridX < trameRes; gridX++) {
      
      // Notez bien cette autre méthode
      int posX = width/trameRes * gridX; //Calculer la position X par rapport à la résolution de notre trame et la largeur de notre plan de travail
      int posY = height/trameRes * gridY; //Calculer la position Y par rapport à la résolution de notre trame et la hauteur de notre plan de travail
      
      color myc = (int)random(255);
      fill(myc);
      ellipse(posX, posY, 10, 10);
      
      //Si on veut calculer la taille de notre forme en respectant
      //la résoulution de notre trame, utilisez cette ligne de code.
      //ellipse(posX, posY, height/trameRes, width/trameRes);
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

