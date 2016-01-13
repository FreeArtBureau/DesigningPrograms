/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////
import processing.pdf.*; // Pour exporter en pdf notre image
boolean savePDF = false;

PImage img;
int PixelSize; // Déclaration d'une variable qui détermine la taille du pixel
float angle;
/////////////////////////// SETUP ////////////////////////////
void setup() {
  img = loadImage("japaneselady.jpg");
  
  // Notez qu'ici, nous pouvons adapter la taille de la fenêtre 
  // en fonction de la taille de l'image chargée.
  size(img.width, img.height);
  PixelSize = 1; // On attribue une valeur de départ pour notre variable PixelSize
  angle = radians(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if (savePDF) beginRecord(PDF, "imagePDF_###.pdf");
  background(0);
  noStroke();
  rectMode(CENTER);
  // On parcourt l'image grâce à une boucle et en fonction
  // de notre varialbe PixelSize ;–)
  for (int x=10; x < width-10; x+=PixelSize) {
    for (int y=10; y < height-10; y+=PixelSize) {

      // on récupère  la couleur du pixel en fonction des variables x & y
      int col = img.get(x, y);

      // Finalement, on dessine des rectanlges (ou des cercles ou n'importe quelle forme)
      // en le remplissant avec les valeurs colormétriques stocké dans notre variable col
      fill(col);

      pushMatrix();
      translate(x, y);
      rotate( angle );
      rect(0, 0, PixelSize, PixelSize);
      //ellipse(x,y,PixelSize,PixelSize);
      popMatrix();
    }
  }
  
     if (savePDF) {
    savePDF = false;
    endRecord();
    println("FINITO !");
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
// Nous avons la possibilité de changer la taille des pixels grâce aux touches '+' ou '-'
// de notre clavier. Nous pouvons aussi les faire pivoter avec les touches GAUCHE/DROIT
//Nous changeons donc l'image de manière dynamique.
void keyPressed() {
  if (key == '+') PixelSize++;
  if (key == '-') PixelSize--;

  if (keyCode == RIGHT) {
    angle += radians(5);
  }

  if (keyCode == LEFT) {
        angle -= radians(5);
  }
  
  // Sauvegarde de l'image en format png ou PDF
  if (key == 's') saveFrame("savedImage_###.png");
  if(key == 'p') savePDF = true;
}

