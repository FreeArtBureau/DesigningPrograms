///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 1.0
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : 
 SKETCH : DESSIN_LINE_02
 PARENT SKETCH : DESSIN_LINE_01
 TYPE : DYNAMIQUE
 
 Draws parallel lines with some options
 */

/////////////////////////// GLOBALS //////////////////////////// 
float len = 15.0;
float xPos, yPos = 0.0;
float step = 3.0;
// Ces booleans permettent de changer de mode de dessin
boolean STROKE, NORM = false;
/////////////////////////// SETUP ////////////////////////////
void setup() {
  size (400, 400); 
  background (255);
  smooth();
  strokeCap(SQUARE);
  xPos = mouseX;
  yPos = mouseY;
}

/////////////////////////// DRAW ////////////////////////////  

void draw() {
  if (mousePressed) {
     
    // First calculate distance
    float d = dist(xPos, yPos, pmouseX, pmouseY);
    //Check in relation to step size
    if (d > step) {
      
     //atan2 permet d'orienter l'angle de notre forme
     //en fonction de la position de notre souris.
     //Nous dessinons donc nos lignes perpendiculaires
     //à notre souris.
      float angle = atan2(mouseY-yPos, mouseX-xPos);
      translate(xPos, yPos);
      rotate(angle);
      stroke(0, 173);
      
      if(STROKE) {
      strokeWeight(d/10);
      }
      if(NORM) {
      float dl = d/50;
      line(0, -len*dl, 0, len*dl);
      }
      if(!NORM) {
      line(0, -len, 0, len);
      }
      
      xPos = xPos + cos(angle) * step;
      yPos = yPos + sin(angle) * step;
    }
  }
}


/////////////////////////// FUNCTIONS ////////////////////////////
// !! IMPORTANT !!
void mousePressed() {
  xPos = mouseX;
  yPos = mouseY;
}

void keyPressed() {
  if (key== 's') saveFrame("IMAGE_###.png");
  if (key== 'r') background(255);
  if (key== '+') step+=.5;
  if (key== '-') step-=.5;
  println("Step size = "+step);
  
  if(key=='w') len+=0.5;
  if(key=='x') len-=0.5;
  
  // Mode de dessin
  if(key=='1') {
    STROKE =!STROKE;
  }
  if(key=='2') {
    NORM =!NORM;
  }
}

