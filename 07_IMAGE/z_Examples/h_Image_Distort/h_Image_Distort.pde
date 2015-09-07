/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage monImage;
int interX = 1;
int interY = 1;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(720, 650);
  smooth();
  monImage = loadImage("japaneselady.png");
}


/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  float mouseXVar = map(mouseX, 0, width, 0.05, 1);
  float mouseYVar = map(mouseY, 0, width, 0.05, 1);

  for (int x=5; x<monImage.width; x+=interX) {
    for (int y=5; y<monImage.height-10; y+=interY) {
      float gridX = width / (float)monImage.width;
      float gridY = height / (float)monImage.height;
      float posX = gridX * x;
      float posY = gridY * y;
      //Récupérer la couleur
      color c = monImage.pixels[y*monImage.width + x];
      
      //Convertir à une valeur de niveau de gris
      int greyScale = round(red(c)*0.222 + green(c)*0.617 + blue(c)*0.071);

      // greyScale to line relief
      float w5 = map(greyScale, 0, 255, 5, 0.2);
      strokeWeight(w5 * mouseYVar + 0.1);
      
      // get neighbour pixel, limit it to image width
      color c2 = monImage.get(min(x+1, monImage.width-1), y);
      stroke(0);
      int greyScale2 = int(red(c2)*0.722 + green(c2)*0.707 + blue(c2)*0.071);
      //JOUER AVEC LA VALEUR 53
      float h5 = 53 * mouseXVar;
      
      float d1 = map(greyScale, 0, 255, h5, 0);
      float d2 = map(greyScale2, 0, 255, h5, 0);
      
      //JOUER AVEC + & - . RAJOUTER D'AUTRES VALEURS.
      
      //line(posX-d1, posY+d1, posX+gridX-d2, posY+d2);
      line(posX-d1, posY+d1,posX+gridX-d2,posY+d2);
    }
  }
}

