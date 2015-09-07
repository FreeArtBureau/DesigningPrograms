/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img;
int pas;
int shapeMaxSize;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  smooth();
  noStroke();
  img = loadImage("japaneselady.jpg");
  pas = 10;
  shapeMaxSize = 50;
  size(img.width, img.height, JAVA2D);

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  float fact = map(mouseX, 0, width, 1, shapeMaxSize);

  for (int x=1; x<width; x+=pas) {
    for (int y=1; y<height;y+=pas) {

      color c = img.get(x, y);

      float lum = (brightness(c)/255)*fact;

      fill(c);
      ellipse(x, y, lum, lum);
    }
  }
}
/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's') saveFrame("savedImage_###.png");
}

