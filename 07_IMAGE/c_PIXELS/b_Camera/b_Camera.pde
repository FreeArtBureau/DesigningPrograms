/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

import processing.video.*;
int pas;
int shapeMaxSize;

Capture cam; // Déclaration d'une variable pour notre video

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480, P2D);
  smooth();
  noStroke();
  // Commencer la lecture de notre video
  cam = new Capture(this, width, height);
 // video.start(); // Activer cette ligne seulement sous Processing 2.0 
  pas = 10;
  shapeMaxSize = 50;
  cam.start(); // add this line for P5 V2
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  cam.read(); // Lire la video

 float fact = map(mouseX, 0, width, 1, shapeMaxSize);
 
 for (int x=0; x<width; x+=pas) {
    for (int y=0; y<height;y+=pas) {
      // Using la méthode get()
      color c = cam.get(x, y); 
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

