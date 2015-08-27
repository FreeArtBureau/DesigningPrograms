///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : FONCTIONS
 SKETCH : FONCTION_03
 PARENT SKETCH : FONCTION_02
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  stroke(255);
  strokeWeight(1);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  randomSeed(1);//Cette fonction permet de générer la même suite de chiffres aléatoires.

  for (int xPos=30; xPos<width-20; xPos+=30) {
    for (int yPos=30; yPos<height-20; yPos+=30) {
      
      int rVal = (int)random(0,2); // Créer une variable aléatoire entre 0 & 1
      //Attention: random() retourne une valeur décimale. Nous donc convertisons en int.
      
      //Si rVal retourne la valeur 0, on exécute ce bloc de code.
      if(rVal == 0) {
      pushMatrix();
      translate(xPos, yPos);
      star();
      popMatrix();
    }
    
    //Si rVal retourne la valeur 1, on exécute ce bloc de code.
    if(rVal == 1) {
       pushMatrix();
      translate(xPos, yPos);
      rotate(radians(45)); //Avec une rotation de 45 degré.
      star();
      popMatrix();
    }
  }
}
}

/////////////////////////// FUNCTIONS ////////////////////////////
void star() {
  line(-15, -15, 15, 15);
  line(15, -15, -15, 15);
  line(-15, 0, 15, 0);
  line(0, -15, 0, 15);
}

