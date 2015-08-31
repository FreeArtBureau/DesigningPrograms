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
 SKETCH : GRID_01
 PARENT SKETCH : 
 TYPE : DYNAMIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

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

  for (int x = 0; x<=width; x+=50) {
    for (int y = 0; y<=height; y+=50) {
      ellipse(x, y, mouseX, mouseY); // USE THIS LINE FIRST.
      
      // Then check these. What is the difference?
      
      //float mx = constrain(mouseX, 50, 100);
      //ellipse(x,y,mx,mx);
      
      //float mx = map(mouseX,0,width,50,100);
      //ellipse(x,y,mx,mx);
      
    }
  }
}

