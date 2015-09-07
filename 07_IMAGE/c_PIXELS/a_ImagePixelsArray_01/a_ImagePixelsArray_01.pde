/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

PImage img;// Déclaration d’une variable du type PImage

/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(255);
  noStroke();
  
  // Charger l'image dans la mémoire
  // Cette image doit exister dans un dossier 'data' à la racine
  // du sketch Processing
  img = loadImage ("japaneselady.jpg"); 
     size(img.width, img.height);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

  // Cette fonction est nécessaire pour charger les pixels
  // dans la mémoire
  img.loadPixels(); // On a aussi besoin de charger les pixels de la caméra
  loadPixels();
  for (int x=0; x<img.width-1; x++) {
    for (int y=0; y<img.height-1; y++) {
      int pos = (y * img.width) + x;

      // Récupère les valeurs colorimétrique pour RVB de l'image
      float rVal =  red(img.pixels[pos]);
      float gVal =  green(img.pixels[pos]);
      float bVal =  blue(img.pixels[pos]);

      pixels[pos] = color(rVal, gVal, bVal);
    }
  }

  // On a besoin de mettre à jour l'affichage des pixels
  // grace à ces fonctions
  img.updatePixels();
  updatePixels();
}

