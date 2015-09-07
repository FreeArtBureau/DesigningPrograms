/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img;// Déclaration d’une variable du type PImage

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(800, 505);
  background(255);
  noStroke();
  
  // Charger l'image dans la mémoire
  // Cette image doit exister dans un dossier 'data' à la racine
  // du sketch Processing
  img = loadImage ("japaneselady.jpg"); 
  
  // Afficher notre image à l'aide de la fonction image()
  // Cette fonction comprend 3 arguments : image, x, y
  
  image(img, 0, 0);
  
  // Il est possible de rajouter 2 autres arguments pour changer 
  // la taille de l'image.
   image(img, 520, 100, 120,250);
     image(img, 520, 350, 280,155);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}
/////////////////////////// FUNCTIONS ////////////////////////////

