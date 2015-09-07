/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img; // Déclaration d’une variable du type PImage


/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(800, 505);
  background(255);
  noStroke();
  
  // Charger l'image dans la mémoire
  // Cette image doit exister dans un dossier 'data' à la racine
  // du sketch Processing
  img = loadImage ("japaneselady.jpg"); 

  image(img, 0, 0);
  
  // On va utiliser une fonction propre à Processing
  // qui permet de récupérer les "pixels" de l'écran
  // Tout d'abord, on crée une nouvelle variable PImage
  PImage pix;
  // Ensuite on va se servir de get() pour 'copier'
  // une partie de l'image. 
  // Les arguments : (x, y, width, height);
  pix = get(190,170,50,50);
  
  // Finalement, on affiche l'image 'pix' à l'endroit qu'on veut.
  image(pix,600,100);
  
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}
/////////////////////////// FUNCTIONS ////////////////////////////

