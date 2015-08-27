/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////

int numCirlces;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 400);
  background(0);
  smooth();
  noFill();
  numCirlces = 0;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  fill(0, 15);
  rect(0, 0, width, height);


  noStroke();
  fill(255, 150);
  float dia = random(100); // Générer des valeurs aléatoires pour la diamètre de notre cercle
  float xPos = random(width); 
  float yPos = random(height);
  ellipse(xPos, yPos, dia, dia);

  //Structure conditionnelle pour tester si vrai ou faux.
  if (numCirlces >= 150) {
    noLoop(); //On arrête l'animation
  }   
  // numCirlces++; > une façon plus simple pour écrire :
  // numCirlces = numCirlces + 1;
  numCirlces++;
}

/////////////////////////// FUNCTIONS ////////////////////////////

// Si on appuie sur n'importe quelle touche de clavier
// on recommence l'animation
void keyPressed() {
  if (keyPressed) {
    loop();
    setup();
  }
}

