///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 INTERACTION : CLAVIER
 SKETCH : KEYPRESSED_05
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 */

/////////////////////////// GLOBALS ////////////////////////////

int dia;
color myc;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  noStroke();
  smooth();
  dia = 5;
  myc = color(255);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0);
  fill(myc);
  if (mousePressed == true) {
    ellipse(mouseX, mouseY, dia, dia);
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's') {
    saveFrame("monImage.tiff");
    println("Saved Image ;––)");
  }
  if (key == 'r') {
    myc = color(255, 0, 0);
  } 
  if (key == 'w') {
    myc = color(255);
  }

  if (key == '+') {
    dia++;
  }

  if (key == '-') {
    dia--;
  }
}

