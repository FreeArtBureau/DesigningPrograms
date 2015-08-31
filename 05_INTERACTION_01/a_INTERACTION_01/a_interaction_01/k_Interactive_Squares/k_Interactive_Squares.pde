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
 SKETCH : INTERACTIVE_SQUARES
 PARENT SKETCH : GRID_02
 TYPE : DYNAMIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

int gridRes = 15; 
/////////////////////////// SETUP ////////////////////////////

void setup() { 
  size(600, 400);
  background(255);
  stroke(255,0,0);
  smooth();
  rectMode(CENTER);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  noFill();
  strokeWeight(0.5);

 
  for (int x = 1; x<=gridRes-1; x++) {
    for (int y = 1; y<=gridRes-1; y++) {
      
      float mx = map(mouseX,0,width,5,73); //X AXIS CONTROLS SIZE OF RECTANGLE
      float my = map(mouseY,0,height,0,TWO_PI);//Y AXIS CONTROLS ROTATION OF RECTANGLE
      
      int xPos = width/gridRes * x; 
      int yPos = height/gridRes * y;
      
      pushMatrix();
      translate(xPos,yPos);//WE TRANSLATE THE CANVAS BY VALUES xPos & yPos
      rotate(my);
      rect(0,0,mx, mx);
      popMatrix();
    }
  }
}

//--------------------------------------------------------------------------

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("img_###.png");
}



