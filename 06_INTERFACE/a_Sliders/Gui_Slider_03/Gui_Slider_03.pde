/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
ControlP5 interfaces;

float rectSize = 40;
float lineLn = 10;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(255);
  smooth();
  rectMode(CENTER);
  interfaces = new ControlP5(this);

  // Créer deux curseurs avec des valeurs de 0 > 100
  // Ces curseurs s'affichent dans notre fenêtre et permettent
  // de changer de valeurs pour la longueur de nos lignes et 
  // la taille de nos rectangles
  Slider s = interfaces.addSlider("lineLn").setPosition(10, 20).setRange(0, 100);
  Slider r = interfaces.addSlider("rectSize").setPosition(10, 40).setRange(0, 100);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  noFill();
  stroke(0);
  // REPEAT REPEAT REPEAT !
  for (int xPos=125; xPos<width-100; xPos+=50) {
    for (int yPos=125; yPos<height-100; yPos+=75) {
      pushMatrix();
      translate(xPos, yPos);
      // dessiner nos lignes
      line(-lineLn, -lineLn, lineLn, lineLn);

      // dessiner nos rectangles
      rect(0, 0, rectSize, rectSize);

      pushStyle();
      fill(255, 0, 0);
      noStroke();

      // dessiner nos cercles
      ellipse(0, 0, 10, 10);
      popStyle();
      popMatrix();
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

