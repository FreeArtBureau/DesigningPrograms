///////////////////////////////////////
/*

 */
/////////////////////////// GLOBALS ////////////////////////////

PImage img;
int cellSize; // Taille de nos carrés
int dec = 10; // Valeur de décalage de nos carrés
boolean freeze;

/////////////////////////// SETUP ///////////////////////////  /

void setup() {
  background(225);
  tint(255, 150); // Transparence de l'image
  freeze = false;
  img=loadImage("japaneselady.jpg");
  size(img.width, img.height);
  smooth();
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  
  // Récupérer une position aléatoire dans le canvas
  int x=(int)random(1, img.width-cellSize);
  int y=(int)random(1, img.height-cellSize);
  
  // Créer des variables aléatoires pour décaler les carrés
  int offSetX=int(random(-dec, dec));
  int offSetY=int(random(-dec, dec));
  // Créer une nouvelle PImage & attribuer une partie de l'image (img)
  // basé sur des valeurs calculés auparavant : x, y, cellSize 
  // Ici, on a fait une séléction de l'image 'img' à une position x, y
  // & avec une zone/taille définie par cellSize.
  
  cellSize = (int)random(5,50);
  PImage newImg = img.get(x, y, cellSize, cellSize);

  // Afficher la nouvelle séléction d'image avec les valeurs offSetX, offSetY
  image(newImg, x+offSetX, y+offSetY);
}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyReleased() {
  if (key == 'f') {
    freeze = !freeze;
    if (freeze) {
      noLoop();
    } 
    else {
      loop();
    }
  }
  if(key == 'q') {
   setup();
   
  }
}

