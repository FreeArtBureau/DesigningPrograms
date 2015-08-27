///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : VARIABLES
 SKETCH : VARIABLE_04
 PARENT SKETCH : NONE
 TYPE : AUTONOMOUS
 */
/////////////////////////// GLOBALS ////////////////////////////
float x;
float angle; // déclaration d'une variable pour l'angle
float len = 30; // longeur de notre ligne
//////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 200);
  background(0);
  // Notez colour mode
  colorMode(HSB,360,100,100); // teinte, saturation, luminosité
  smooth();
  noFill();
  strokeWeight(5);
  x = 0;
  angle = radians(0); // on convertit les radians en angles
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  
  translate(x, height/2);
  rotate(angle);
  
  // frameCount est une variable interne propre à Processing
  // qui stocke en mémoire le nombre d'images depuis le lancement
  // du programme. On peut donc s'en servir comme une variable aussi.
  // Ici on se sert de frameCount pour modifier la teinte
  // le signe % [modulo] permet de revenir à zero aprés avoir atteint 360
  stroke(frameCount%360, 100,100);
  
  line(-len, -len, len, len);
  
  // Que se passe t-il si on active cette ligne ?
  //len = sin(angle*0.35)*60;
  
  x+=1.5;
  angle += 0.015;
  
  // Ceci est une structure conditionelle. Elle permet de faire
  // un test et d'agir en conséquence à ce test. 
  // Donc, si la variable x est supérieur ou égal à la largeur de notre
  // fenêtre, remplisser en noir le fond et remettre à zero l'x
  if(x >=width) {
   background(0); 
   x = 0;
  }
    
}

/////////////////////////// FUNCTIONS ////////////////////////////


