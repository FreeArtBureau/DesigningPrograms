/*
 SKETCH : MONOGRAMME
 PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////
// Importer la bibliothèque ControlP5
import controlP5.*;
//Declarer un objet de la classe controlP5
ControlP5 interfaces;

PFont font;
char letter;
float xPos, yPos;

float fontSize = 100;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 600);
  background(0);
  smooth();
  noStroke();
  // création de notre interface
  interfaces = new ControlP5(this);  
  
  // Création de notre slider
  Slider nS = interfaces.addSlider("fontSize").setPosition(10, 20).setRange(1.0, 800.0); 

  frameRate(8); // 8 images/seconde
  font = createFont("AnonymousPro-Bold", 500);
  
  letter = ' ';
  textAlign(CENTER, CENTER);

  xPos = width/2;
  yPos = height/3;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //Effet de transparence 
  fill(0, 7);
  rect(0, 0, width, height);

  fill(0, 255, 255, 33);
  // interaction avec la souris sur l'axe X
  // jouant avec la taille de notre fonte
  //fontSize = map(mouseX, 0, width, 12, 800);
  
  textFont(font, fontSize);
  
  // Letter key interaction
 // text(letter, xPos, yPos);
  
  // Autonomous motion
  text(char((int)random(35,110)), xPos, yPos);
}

/////////////////////////// FUNCTIONS ////////////////////////////

// Simple key interaction
void keyPressed() {
  if (keyPressed)
    letter = key;
}

