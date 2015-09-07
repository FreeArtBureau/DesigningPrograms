/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
import processing.pdf.*; // Pour exporter en pdf notre image
boolean savePDF = false;

PImage img;
PShape shp;
int pas;
int shapeMaxSize;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(510, 510);
  background(0);
  noFill();
  smooth();
  strokeCap(SQUARE);
  img=loadImage("japaneselady.jpg");
  shp = loadShape("shape_01.svg");
  shp.disableStyle();
  shapeMode(CENTER);
  pas = 10;
  shapeMaxSize = 50;
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
 if (savePDF) beginRecord(PDF, "imagePDF_###.pdf");
  background(255);

  float fact = map(mouseX, 0, width, 1, shapeMaxSize);

  // On parcourt notre image grâce à des boucles
  for (int x=1; x<width; x+=pas) {
    for (int y=1; y<height;y+=pas) {

      // On récupère les pixels à chaque endroit
      // et avec un pas désigné par la variable en haut 'pas'
      color col = img.get(x, y);
      float lum = (brightness(col)/255)*fact;      
      stroke(col);
      strokeWeight(lum/2);
      //DESSINER NOTRE CROIX
      shape(shp, x, y, lum, lum);
    }
  }
   if (savePDF) {
    savePDF = false;
    endRecord();
  }
}
/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's') saveFrame("savedImage_###.png");
  if(key == 'p') savePDF = true;
}
