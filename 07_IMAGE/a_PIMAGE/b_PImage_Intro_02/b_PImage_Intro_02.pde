/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img; // Déclaration d’une variable du type PImage

PImage img2; // Déclaration d’une deuxième image

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(500, 505);
  background(255);
  noStroke();
  
  // Charger l'image dans la mémoire
  // Cette image doit exister dans un dossier 'data' à la racine
  // du sketch Processing
  img = loadImage ("japaneselady.jpg"); 
  
  img2 = loadImage ("paper.jpg"); // Deuxième image 
  
  // On affiche la deuxième image d'abord
  image(img2, 0, 0);
  
  // La fonction tint() permet de créer des filtres simples
  // Ici trois exemples de la fonction tint avec les effets de transparence
  
  tint(255,127); // 50 % transparence
  //tint(255,150,0); // Couleur orange (sans transparence)
  //tint(200,0,150,110); // Mélange avec transparence
  image(img, 0, 0);
  
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}
/////////////////////////// FUNCTIONS ////////////////////////////

