///////////////////////////////////////////
/*
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 >>> www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 LES BASES : FONCTIONS
 SKETCH : CHOSEBIZARRE_02
 PARENT SKETCH : CHOSEBIZARRE
 TYPE : STATIQUE
 */
/////////////////////////// GLOBALS ////////////////////////////

//////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke(); 
  //translate(200,200);// Nous n'avons plus besoin de cette commande
  
  choseBizarre(100, 100);//Ici, on appele notre fonction avec les valeurs pour x & y

  choseBizarre(200, 100);
  
  choseBizarre(200, 200);
  
  choseBizarre(300, 200);
  
  choseBizarre(300, 300);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////
// Notez bien que dans cet exemple, on définit également
// des arguments pour notre fonction. 

void choseBizarre(float _x, float _y) {
  
  fill(255);
  // On a besoin de push & popMatrix pour éviter de cumuler les translations.
  pushMatrix();
  translate(_x, _y); // ensuite, on utilise ces arguments pour positionner les formes
  
  ellipse(0, 0, 100, 50);
  ellipse(0, 0, 50, 100);
  popMatrix();
}

