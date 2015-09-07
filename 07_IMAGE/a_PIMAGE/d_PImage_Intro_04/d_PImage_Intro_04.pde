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
  // Afficher notre image à gauche
  image(img, 0, 0);
  
  
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  // Déclaration et attribution d'une variable pour récupérer les 
  // informations colormétriques du pixel. La position étant déterminée 
  // par la position de notre souris > mouseX & mouseY
  // la fonction get(x,y) permet justement ça ;–)
  color pix = get(mouseX, mouseY);
  
  // On dessine un rectangle à droite et nous le remplissons
  // avec la couleur du pixel choisie par notre souris.
  fill(pix); 
  rect(600, 100, 100, 100);
  
  // Déclaration et attribution d'une nouvelle PImage
  // ici, la méthode get() récupère une zone de pixels
  PImage selection = img.get(mouseX, mouseY, 100,100);
  // Ensuite, on affiche la sélection  
  image(selection, 600, 300);
}
/////////////////////////// FUNCTIONS ////////////////////////////

