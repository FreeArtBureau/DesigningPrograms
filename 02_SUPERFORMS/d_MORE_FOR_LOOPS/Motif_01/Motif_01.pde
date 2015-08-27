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
 SKETCH : MOTIF_01
 PARENT SKETCH : NONE
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

int tramRes = 30;
int randSeed = 10;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noFill();
  strokeWeight(1);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  randomSeed(randSeed); // La fonction randomSeed() permet de retourner chaque fois la même valeur aléatoire.

  for (int gridY = 1; gridY < tramRes-1; gridY++) {
    for (int gridX = 1;  gridX < tramRes-1; gridX++) {
      int posX = width/tramRes * gridX;
      int posY = height/tramRes * gridY;
      color myc = (int)random(255);
      stroke(myc);
      
      //rand calculates a value between 0 & 1
      int rand = (int)random(0, 2);

      //If the result of rand is 0 then run code
      if (rand == 0) {
        line(posX, posY, posX+width/tramRes, posY+height/tramRes);
      }

      //If the result of rand is 1 then run code
      if (rand == 1) {
        line(posX, posY+width/tramRes, posX+height/tramRes, posY);
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

void myLine_01() {
  stroke(255,0,0);
  line(-15, -15, 15, 15);
}

void myLine_02() {
  stroke(0,0,255);
  line(15, -15, -15, 15);
}

//Ici, nous avons crée une fonction qui générère une nouvelle valeur pour ensuite la passer dans randomSeed()
void keyPressed() {
  background(0);
  randSeed = (int)random(1000);
}

