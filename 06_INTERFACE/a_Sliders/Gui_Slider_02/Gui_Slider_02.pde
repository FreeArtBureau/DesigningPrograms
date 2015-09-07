/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////
// Une bibliothèque pour créer des interfaces
import controlP5.*;
ControlP5 interfaces;

float rectSize = 200; // Une variable
float angle = 0;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(255);
  smooth();
  noFill();
  rectMode(CENTER);
  interfaces = new ControlP5(this);
  // Création d'un curseur qui varie la valeur de rectSize
  // donc la taille de notre forme
  Slider s1 = interfaces.addSlider("rectSize").setPosition(10, 20)
    .setRange(1, 400);
  // Deuxième curseur qui varie l'angle de rotation  
  Slider s2 = interfaces.addSlider("angle").setPosition(10, 40)
    .setRange(0, radians(360));
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  fill(0);

  pushMatrix();
  translate(width/2, height/2);
  // On applique notre angle à la fonction rotate()
  // pour faire pivoter notre forme
  rotate( angle );
  rect(0, 0, rectSize, rectSize);
  popMatrix();
}

/////////////////////////// FUNCTIONS ////////////////////////////

