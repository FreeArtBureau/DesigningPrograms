/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img;
PShape shp;
int pas;
int shapeMaxSize;

/////////////////////////// SETUP ////////////////////////////

void setup() {
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
  size(img.width, img.height, JAVA2D);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);

  float fact = map(mouseX, 0, width, 1, shapeMaxSize);

  // On parcourt notre image grâce à des boucles
  // 
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
  filter(GRAY); // on a rajouté un filtre noir & blanc
}
/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's') saveFrame("savedImage_###.png");
}
