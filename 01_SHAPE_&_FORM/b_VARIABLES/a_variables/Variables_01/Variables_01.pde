///////////////////////////////////////////
/*

 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : VARIABLES
 SKETCH : VARIABLE_01
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

// Déclaration de notre variable
int xPos; // Type de donnée plus son nom

//////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 200);
  background(0);
  smooth();
  fill(255);
  noStroke();
  xPos = 0; // affectation. Valeur initiale

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  
  // Ici on utilise notre variable dans la fonction ellipse
  // pour le positionner sur l'axe 'x' 
  ellipse(xPos, height/2, 50, 50);
  
  // *IMPORTANT*
  // Ensuite pour faire varier notre variable
  // on a besoin de la mettre à jour.
  // ici, on ajoute une valeur de 1
  // N'oubliez pas que nous sommes dans la strucutre draw()
  // qui exécute les commandes 60 images par seconde ! 
  xPos = xPos + 1;
 
}

/////////////////////////// FUNCTIONS ////////////////////////////


