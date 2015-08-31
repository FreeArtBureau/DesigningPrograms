///////////////////////////////////////
/*
DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2010/11 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 
 INTERACTION : INTERACTION_01
 SKETCH : KEYPRESSED_01
 PARENT SKETCH : NONE
 TYPE : DYNAMIC
 
 */
/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  rectMode(CENTER);
  noStroke();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

  //Le code entre les accolades est exécuté lorsqu'on maintient
  //une touche du clavier appuyé

  background(0);

  if (keyPressed == true) {
    fill(255, 0, 0);
    rect(width/2, height/2, 200, 200);
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
//Le code entre les accolades est exécuté lorsqu'on appuie
//une fois sur le clavier. Notez la différence.

/*
void keyPressed() {
 fill(255, 0, 0);
 rect(width/2, height/2, 200, 200);
 }
 */

