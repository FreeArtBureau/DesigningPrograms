///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : VARIABLES
 SKETCH : VARIABLE_03
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

float dia;
float angle; // déclaration d'une variable pour l'angle
//////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noFill();
  stroke(255,100);
  dia = 0;
  angle = radians(0); // on convertit les radians en angles
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0); // on a désactivé cette ligne. Que se passe-t-il ?
  
  //mouseX & mouseY sont des variables propres à Processing
  //qui stockent les valeurs x & y de la souris - Donc sa position !
  ellipse(mouseX, mouseY, dia, dia); 
  
  // Un peu de maths simple
  // la fonction sin(angle) crée un mouvement sinusoidal
  // on multiplie par un facteur qui détermine l'ampleur de ce mouvement
  // Modifiez les deux valeurs, 0.05 & 50
  // Qu'observez-vous?
  
  dia = sin(angle*0.01) * 50;
  angle++;
  
  //angle ++; est exactement la même chose que angle = angle + 1;  
}

/////////////////////////// FUNCTIONS ////////////////////////////


