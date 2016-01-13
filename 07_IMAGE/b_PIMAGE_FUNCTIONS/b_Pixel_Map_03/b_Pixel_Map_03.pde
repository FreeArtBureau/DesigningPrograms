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
float fact;

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
  fact = 9.6;
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);

  //float fact = map(mouseX, 0, width, 1, shapeMaxSize);

  // On parcourt notre image grâce à des boucles
  // 
  for (int x=10; x<width-10; x+=pas) {
    for (int y=10; y<height-10; y+=pas) {
      pushMatrix();
      translate(x, y);
      rotate(sin(frameCount*0.01)*TWO_PI);
      // On récupère les pixels à chaque endroit
      // et avec un pas désigné par la variable en haut 'pas'
      color col = img.get(x, y);

      float lum = (brightness(col)/255)*fact; 
      
      if (lum >= 10) {    
        stroke(col);
        strokeWeight(lum/2);

        //DESSINER NOTRE CROIX
        shape(shp, 0, 0, lum, lum);
      }
      popMatrix();
    }
  }
  filter(GRAY); // on a rajouté un filtre noir & blanc
  
  //fact+=0.007;
  fact=abs(sin(frameCount*0.006)*30.1);
 
}
/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's') saveFrame("savedImage_###.png");
}

