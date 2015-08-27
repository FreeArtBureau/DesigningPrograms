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
 SKETCH : MOTIF_02
 PARENT SKETCH : NONE
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

int tramRes = 20;
int randSeed=1;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noFill();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  randomSeed(randSeed);
  for (int gridY=1; gridY<tramRes-2; gridY++) {
    for (int gridX=1; gridX<tramRes-2; gridX++) {
      
      float rVal = (int)random(50,200);
      float gVal = (int)random(60,160);
      float bVal = (int)random(30,170);
      stroke(rVal,gVal,bVal);
      
      int posX = width/tramRes*gridX;
      int posY = height/tramRes*gridY;

      int rand = (int)random(0, 3);    
      if (rand == 0) {
        drawLines(posX+width/tramRes, posY+height/tramRes);
      }

      if (rand == 1) {
        drawLines2(posX+width/tramRes, posY+height/tramRes);
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void drawLines(int x, int y) {
  for (int i=0; i<30; i+=5) {
    line(x-10+i, y-10, x-10+i, y+10);
  }
}

void drawLines2(int x, int y) {
  for (int i=0; i<30; i+=5) {
    line(x-10, y-10+i, x+10, y-10+i);
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  background(0);
  randSeed = (int)random(1000);
}

