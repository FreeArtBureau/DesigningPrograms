/*
 SKETCH : MONOGRAMME_3D
 PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////

import peasy.*;
PeasyCam cam; // Déclarer un objet pour notre caméra
float angle;

PFont font;
char letter;
float xPos, yPos;

float fontSize;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 600, P3D);
  background(0);
  smooth();
  noStroke();
  frameRate(8); // 8 images/seconde
  font = createFont("AnonymousPro-Bold", 500);
  
  // Création de notre caméra
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

  letter = 'A';
  textAlign(CENTER, CENTER);

  angle = radians(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(243); 
  
  // Faire pivoter notre forme grâce à la variable frameCount
  rotateX(-frameCount*0.07);
  rotateY(-frameCount*0.07);

  pushMatrix();
  float z = sin(angle*0.05) * 20;
  translate(0, 0, z);

  // Effet de transparence
  //fill(0, 3);
  //rect(-width/2, -height/2, width, height);

  fill(0, 255, 255, 33);
  textFont(font, 100);
  text(letter, 0, 0);

  popMatrix();

  angle+=0.5;
}

/////////////////////////// FUNCTIONS ////////////////////////////

// Simple key interaction
void keyPressed() {
  if (keyPressed)
    letter = key;
}

