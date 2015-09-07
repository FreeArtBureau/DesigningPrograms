/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

import processing.video.*;
Capture cam; // Nouvel objet pour notre caméra
float depth;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480, P3D);
  rectMode(CENTER);

  // Nouvelle capture 
  cam = new Capture(this, width, height, 12);
  //cam.start(); // Add this for P5 V2 ++
  cam.start();
depth = 0;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  background(255);
  noStroke();
  // Cette fonction est nécessaire pour charger les pixels dans la mémoire
  cam.loadPixels(); 

  int pas = (int)map(mouseX, 0, width, 1, 20);
  for (int x=0; x<cam.width-1; x+=pas) {
    for (int y=0; y<cam.height-1; y+=pas) {

      int pos = (y * cam.width) + x; // calcul pour position de nos Pixels

      //color c = cam.pixels[pos];
      color c = (int)blue(cam.pixels[pos]);

      depth = brightness(cam.pixels[pos])*5;
      // Pixelate

      float pointSize = map(mouseY, 0, height, 0.1, 7);
      fill(c);
      pushMatrix();
      translate(x, y, depth);
      //      rect(0,0,rectSize,rectSize);
           strokeWeight(pointSize);
      stroke(c);
      point(0, 0);
      popMatrix();
    }
  }
  // On a besoin de mettre à jour l'affichage des pixels
  // grace à cette fonction
  cam.updatePixels();

  //  println(frameRate); // pour debugger et voir la vitesse
}

