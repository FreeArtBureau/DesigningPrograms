///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 1.0
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 INTERACTION : DESSIN
 SKETCH : DESSIN_GOMME
 PARENT SKETCH : 
 TYPE : DYNAMIQUE
 
 NB
  - Appuyez sur la touche '1' pour dessiner, la touche '2' pour gommer.
  - Touche 'r' pour recommencer
 - Touches + et - pour augmenter la taille de la gomme 
 */
/////////////////////////// GLOBALS ////////////////////////////



int mode;
int dia;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 400);
  background(0);
  smooth();
  noFill();
  mode = 0;
  dia = 10;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if (mousePressed) {
    if (mode == 0) {
      float thick = dist(mouseX, mouseY, pmouseX, pmouseY);
      strokeWeight(thick/2);
      stroke(255, 173);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }

    if ( mode == 1) {
      noStroke();
      fill(0);
      ellipse(mouseX, mouseY, dia, dia);
    }
  }
}
/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key=='1') mode=0;
  if (key=='2') mode=1;
  
  if(key == 'r') setup();
  if(key == '+') dia++;
  if(key == '-') dia--;
}

