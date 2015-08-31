///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 1.0 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 INTERACTION_01
 SKETCH : GRID_02
 PARENT SKETCH : GRID_01
 TYPE : DYNAMIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

int gridRes = 10; //Reosution of our grid
/////////////////////////// SETUP ////////////////////////////


void setup() { 
  size(600, 400);
  background(255);
  noFill();
  smooth();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  stroke(0, 0, 255);

  for (int x = 1; x<=gridRes-1; x++) {
    for (int y = 1; y<=gridRes-1; y++) {
      
     int xPos = width/gridRes * x; // A little bit of math to calculate the x positon
     int yPos = height/gridRes * y; // A little bit of math to calculate the y positon
     
     float mx = map(mouseX, 0, width, 50, 200);
      ellipse(xPos, yPos, mx, mx); 
    }
  }
}

