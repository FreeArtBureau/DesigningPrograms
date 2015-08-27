///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : FONCTIONS
 SKETCH : CHOSEBIZARRE_03
 PARENT SKETCH : CHOSEBIZARRE_02
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

//////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke(); 
  
  // Notez bien la troisième valeur qui correspond 
  // à l'argument qui définit la taille de la forme
  // voir la construction de notre fonction en bas
  
  choseBizarre(100, 100, 2);

  choseBizarre(200, 100, 10);
  
  choseBizarre(200, 200, 5);
  
  choseBizarre(300, 200, 1);
  
  choseBizarre(300, 300, 3);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////
// On a rajouté un troisième argument pour définir la taille
void choseBizarre(float _x, float _y, int size) {
  
  fill(255);
  // On a besoin de push & popMatrix pour éviter de cumuler les translations.
  pushMatrix();
  translate(_x, _y); // ensuite, on utilise ces arguments pour positionner les formes
   
  // Notez bien l'attribution de notre argument 'size' ici !
  scale(size);
  ellipse(0, 0, 10, 5);
  ellipse(0, 0, 5, 10);
  popMatrix();
}

