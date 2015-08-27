///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : VARIABLES
 SKETCH : VARIABLE_02
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

float yPos;
float dia;
//////////////////////// SETUP ////////////////////////////

void setup() {
  size(200, 400);
  background(0);
  smooth();
  noFill();
  stroke(255,100);
  // height est une variable propre à Processing 
  // Elle est égale à la hauteur de la fenêtre indiqué auparavant 
  // dans la fonction size(...) Donc height = 400 pixels.
  yPos = height; 
  dia = 0;

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0); // on a désactivé cette ligne. Que se passe-t-il ?
  
  ellipse(width/2, yPos, dia, dia); //Notez bien le changement par rapport à l'exemple Variables_01
  yPos = yPos - 0.8;
  
  dia += 0.4; // notez bien la syntaxe
  
  // dia += 0.5; est exactement la même chose que dia = dia + 0.5; 
  // C'est un raccourci souvent utilisé
  // dia -= 2; est la même chose que dia = dia - 2;
  // dia *= 5; >>> dia = dia * 5; 
}

/////////////////////////// FUNCTIONS ////////////////////////////


