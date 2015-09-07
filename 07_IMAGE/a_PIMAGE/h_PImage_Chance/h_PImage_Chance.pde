/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img; // Déclaration d’une variable du type PImage
PImage pix;

// Changer cette valeur et observer si qui se passe
int pixelSize = 60;
int x;
float y;
float yPosOff; // offset

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(800, 505);
  background(255);
  noStroke();
  img = loadImage ("japaneselady.jpg"); 
  // image(img, 0, 0);
  y=0;
  yPosOff = 0;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  
  // Récupérer les coordonnées de manière aléatoire
  int xPos = (int)random(img.width);
  int yPos = (int)random(img.height);
  
  // Attribuer ces coordonnées à pix (qui est une variable du type PImage)
  pix = img.get(xPos, yPos, pixelSize, pixelSize);

  // Essayer des valeurs de division différentes.
  //pix = img.get(xPos, yPos, pixelSize/8, pixelSize);

  // Activer / Désavtiver cette ligne
  // Que se passe-t-il ?
  //yPosOff = random(-pixelSize,10);

  for ( x=0; x<width; x+=pixelSize) {
    // Essayer des valeurs de division différentes.
    //for ( x=0; x<width; x+=pixelSize/2) {
    // Que se passe-t-il si on mets ces lignes de code dans la boucle ?    
    /*
     int xPos = (int)random(img.width);
     int yPos = (int)random(img.height);
     
     pix = img.get(xPos, yPos, pixelSize, pixelSize);
     */
    image(pix, x, y+yPosOff); 
    // Activer / Désavtive cette ligne
    //yPosOff = yPosOff + 0.03;
  }
  
  yPosOff = yPosOff + .03;
  y+=random(60.0); // Jouer avec cette valeur
}
/////////////////////////// FUNCTIONS ////////////////////////////

// Petite fonction qui redémarre le code
void mousePressed() {
  setup();
}

void keyPressed() {
  if (key == 's') saveFrame("savedImage_###.png");
}

