///////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2010/11 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 

 INTERACTION : INTERACTION_01
 SKETCH : MOUSEPRESSED_01
 PARENT SKETCH : MOUSE_DRAW
 TYPE : DYNAMIC

 */
/////////////////////////// GLOBALS ////////////////////////////

// Ces 2 variables jouent sur les arguments de la fonction sin()
// qui modifie la taille de nos ellipses

float frequency = 0.05; // cette variable modifie la fréquence à laquelle on change de taille
float sizeMax = 50; // cette variable gère la taille maximale de notre ellipse

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(700, 400);
  background(0);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //Le code entre les accolades est exécuté lorsqu'on maintient
  //le button de la souris appuyé  
  if (mousePressed == true) {
    fill((frameCount*0.5)%360, 100, 100);

    // Variable dia varie la taille des ellipses en utilisant la function sinus
    // Notez l'utilisation de nos 2 variables déclarées en globales : frequency & sizeMax
    float dia = sin(frameCount * frequency) * sizeMax;

    ellipse(mouseX, mouseY, dia, dia);   
   }

}

/////////////////////////// FUNCTIONS ////////////////////////////

