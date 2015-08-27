/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/


/////////////////////////// GLOBALS ////////////////////////////

int numEllipse = 300; // Variable qui détermine le nombre de cercles à dessiner
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 400);
  background(0);
  smooth();
  noStroke();
  fill(255,150);
  // La boucle FOR pour dessiner un nombre (détérminé par la variable numEllipse) de cercles 
   for (int i=0; i<numEllipse; i++) {
     
    float xPos = random(width); // Générer des valeurs aléatoires pour la position X de nos cercles
    float yPos = random(height); // Générer des valeurs aléatoires pour la position Y de nos cercles
    float dia = random(5,50);// Générer des valeurs aléatoires pour la diamètre de nos cercles, entre 5 & 50
    ellipse(xPos, yPos, dia, dia);
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
 

}

/////////////////////////// FUNCTIONS ////////////////////////////

