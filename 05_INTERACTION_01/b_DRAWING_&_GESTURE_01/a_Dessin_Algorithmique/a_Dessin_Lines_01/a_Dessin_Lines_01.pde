///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 1.0
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : 
 SKETCH : DESSIN_LINE_01
 
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 */

/////////////////////////// GLOBALS //////////////////////////// 


/////////////////////////// SETUP ////////////////////////////
void setup() {
  size (800, 400); 
  background (255);
  smooth();
}

/////////////////////////// DRAW ////////////////////////////  

void draw() {
  if (mousePressed == true) {
    // La variable weight permet d'agir sur la largeur de la ligne  
    // par rapport à la vitesse du mouvement de notre souris.
    // On utilise la fonction dist() qui calcule la distance
    // entre deux points pour ce faire.

    float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
    strokeWeight(weight/2);
    stroke(0, 173);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}


/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key== 's') saveFrame("IMAGE_###.png");
  if (key== 'r') background(255);
}

