///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 1.0 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 PIXELS : INTRODUCTION
 SKETCH : PIMAGE_INTRO_02
 PARENT SKETCH : PIMAGE_INTRO_01
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

PImage a;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(650, 400);
  background(0);
  smooth();
  a = loadImage("japaneselady.jpg"); //On charge notre photo
  image(a, 0,0); // On l'affiche à l'écran
  

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  
  //À l'aide d'une boucle on va dessiner plusieurs lignes avec des colours différents
  //par rapport à la position x, y et la valeur i
  for(int i=0; i<width; i++) {
    
  color pixel = get(i,mouseY); // Notez que nous récupérons au position i sur l'axe x
  stroke(pixel); //
  line(200+i,0, 200+i,height);
  
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

