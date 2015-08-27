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
 SKETCH : TRAME_DÉCALÉE
 PARENT SKETCH : NONE
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

int trameRes = 20; // Résolution de notre trame (x & y)
int randSeed = 10;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  fill(255);
  noStroke();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  randomSeed(randSeed);
  for (int gridY = 1; gridY < trameRes; gridY++) {
    for (int gridX = 1;  gridX < trameRes; gridX++) {
      
      int posX = width/trameRes * gridX; //Calculer la position X par rapport à la résolution de notre trame et la largeur de notre plan de travail
      int posY = height/trameRes * gridY; //Calculer la position Y par rapport à la résolution de notre trame et la hauteur de notre plan de travail
      
      color myc = (int)random(255);
      fill(myc);
      
      //Plus la souris est décalée vers la droite, plus le décalage de la forme est important.
      float xOff = random(-1,1)*mouseX/20;
      ellipse(posX+xOff, posY, mouseY/15, mouseY/15);

    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

