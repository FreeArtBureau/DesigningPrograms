/*
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
 SYMMETRY 22/11/11
 Introduces loops, rotation & transformation to draw patterns.
 
 THE FREE ART BUREAU 2011
 http://www.freeartbureau.org
 info@freeartbureau.org
 
 Licensed under GNU General Public License (GPL) version 3.
 http://www.gnu.org/licenses/gpl.html
 
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
 **NB 
 
 */

////////////////////////// GLOBALS ///////////////////////////

float angleStep = 90;
float xPos, yPos;
float angle;
float scaling = 7;

////////////////////////// SETUP ///////////////////////////
void setup() {
  size(400, 400);
  smooth();
  background(0);
  noStroke();
  fill(0,255,255);
}

////////////////////////// DRAW ///////////////////////////
void draw() {
  //Translate the coordinate system so we rotate from the center.
  translate(width/2, height/2);
  
  //Repeat our form by the number designated by the variable angleStep.
  //So 360/90 = 4
  //Our form will repeat 4 times.
  for (float theta=0; theta<360; theta+=angleStep) {
    
    //Create a simple random movement algorithm.
    angle += random(-0.13, 0.14);
    xPos+= sin(angle) / scaling;
    yPos+= cos(angle) / scaling;

    //Draw an ellipse
    ellipse(xPos, yPos, 0.5, 0.5);
    
    //And each repeated form is rotated by 90° (also designated by angleStep)
    rotate(radians(angleStep));
  }
}

////////////////////////// KEYS ///////////////////////////
void keyPressed() {
  if (key == 'q' || key == 'Q') {
    background(0);
    //RÉINITIALISER NOS PARAMÈTRES POUR RECOMMENCER
    xPos = 0;
    yPos = 0;
    translate(width/2, height/2);
  }
}

