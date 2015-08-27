///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : FONCTIONS
 SKETCH : STAR_02
 PARENT SKETCH : STAR
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 300);
  background(0);
  smooth();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
    // Effect de traînée
    fill(0,10);
    noStroke();
    rect(0,0,width, height);
    
    star(100, 200, color(255,255,0));
    
    star(200, 100, color(255,0,255));
    
    star(mouseX, mouseY, color(255,0,0));
}

/////////////////////////// FUNCTIONS ////////////////////////////

void star(float _x, float _y, color c) {
  strokeWeight(0.5);
  stroke(c);
  pushMatrix();
  translate(_x, _y);
  line(-15, -15, 15, 15);
  line(15, -15, -15, 15);
  line(-15, 0, 15, 0);
  line(0, -15, 0, 15);
  popMatrix();
}
