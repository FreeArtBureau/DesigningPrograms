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
 SKETCH : FONCTION_03b
 PARENT SKETCH : FONCTION_03
 TYPE : DYNAMIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

int randSeed = 1;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  stroke(255);
  strokeCap(SQUARE);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  randomSeed(randSeed);//Cette fonction permet de générer la même suite de chiffres aléatoires.
  strokeWeight(mouseX/10); // Interaction sur l'épaisseur du trait avec le mouvement de la souris sur l'axe X.
  
  for (int xPos=30; xPos<width-30; xPos+=30) {
    for (int yPos=30; yPos<height-30; yPos+=30) {

      int rVal = (int)random(0, 2); // Créer une variable aléatoire entre 0 & 1
      //Attention: random() retournce une valeur décimale. Nous donc convertisons en int.

      //Si rVal retourne la valeur 0, on exécute ce bloc de code.
      if (rVal == 0) {
        pushMatrix();
        translate(xPos, yPos);
        myLine_01();
        popMatrix();
      }

      //Si rVal retourne la valeur 1, on exécute ce bloc de code.
      if (rVal == 1) {
        pushMatrix();
        translate(xPos, yPos);
        //rotate(radians(45)); //Avec une rotation de 45 degré.
        myLine_02();
        popMatrix();
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void myLine_01() {
  stroke(255, 0, 0);
  line(-15, -15, 15, 15);
}

void myLine_02() {
  stroke(0, 0, 255);
  line(15, -15, -15, 15);
}

//Ici, nous avons crée une fonction qui génère une nouvelle valeur 
//pour ensuite la passer dans randomSeed() - (à chaque fois que nous appuyons sur le clavier)
void keyPressed() {
  background(0);
  randSeed = (int)random(1000);
}

