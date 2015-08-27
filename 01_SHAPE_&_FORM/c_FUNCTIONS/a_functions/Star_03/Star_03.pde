///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : FONCTIONS
 SKETCH : STAR_03
 PARENT SKETCH : STAR_02
 TYPE : DYNAMIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

float angle; // variable pour faire pivoter notre étoile
float angleSpeed = 0.01; // var pour la vitesse de rotation
float sizeMax = 10; // var pour la taille maximal de la forme
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 400);
  background(0);
  smooth();
  angle = radians(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
    // Effect de traînée
    fill(0,10);
    noStroke();
    rect(0,0,width, height);
    
    star(150, 300, color(50,255,0), 1);
    
    star(400, 150, color(0,0,255), 1);
    
    star(mouseX, mouseY, color(255,0,0), -1);
}

/////////////////////////// FUNCTIONS ////////////////////////////
// On a rajouté un autre argument, direction, 
// pour changer le sens de la rotation
// > -1 = clockwise  
// >  1 = counter clockwise

void star(float _x, float _y, color c, int direction) {
  strokeWeight(0.5);
  stroke(c);
  pushMatrix();
  translate(_x, _y);
  rotate(angle*direction); // Notez bien la rotation + direction
  
  // Ici, la fonction sin() permet de créer une oscillation
  // On s'en sert pour modifier l'échelle et donc 
  // la taille de notre étoile
  float size = sin(frameCount * angleSpeed) * sizeMax;
  scale(size);
  
  line(-15, -15, 15, 15);
  line(15, -15, -15, 15);
  line(-15, 0, 15, 0);
  line(0, -15, 0, 15);
  popMatrix();
  
  angle += 0.05; // mise-à-jour de l'angle

}
