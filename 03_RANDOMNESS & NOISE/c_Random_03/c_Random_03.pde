/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////

//int numCirlces = 0;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 400);
  background(0);
  smooth();
  noFill();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  fill(0, 15);
  rect(-1, -1, width+1, height+1);

  //Créer des variables aléatoires pour mes valeurs de couleurs
  float rVal = random(255);
  float bVal = random(255);
  float gVal = random(255);

  stroke(rVal, gVal, bVal); // Appeler les variables pour les couleurs

  float dia = random(100); // Générer des valeurs aléatoires pour la diamètre de notre cercle
  float xPos = random(width); 
  float yPos = random(height);

  //Créer des variables aléatoires pour mes valeurs d'épaisseur de trait.
  pushStyle();
  float rStroke = random(0.5, 10);
  strokeWeight(rStroke);  
  ellipse(xPos, yPos, dia, dia);
  popStyle();
  
  /*
  //Structure conditionnelle pour tester si vrai ou faux.
   if (numCirlces >= 25) {
   noLoop();
   }   
   numCirlces++; 
   */
}

/////////////////////////// FUNCTIONS ////////////////////////////

