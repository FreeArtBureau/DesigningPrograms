/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */
/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
ControlP5 interfaces;

float rectSize = 40;
float lineLn = 30;
float angle = radians(45);


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(255);
  smooth();
  rectMode(CENTER);
  interfaces = new ControlP5(this);  

  // Créer trois curseurs avec des valeurs :
  // Ces curseurs s'affichent dans notre fenêtre et permettent
  // de changer de valeurs pour la longueur de nos lignes, 
  // la taille de nos rectangles et l'angle de rotation des rectangles
  Slider s = interfaces.addSlider("lineLn").setPosition(10, 20).setRange(0, 100);
  Slider r = interfaces.addSlider("rectSize").setPosition(10, 40).setRange(0, 100);
  Slider a = interfaces.addSlider("angle").setPosition(10, 60).setRange(0, TWO_PI);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  // Voici une fonction de dessin - Cette fonction porte un nom 'trame()'
  // et se trouve en bas. Vous verrez que cette fonction comprend exactement
  // les mêmes lignes de code dans le sketch précédent. Créer une fonction est
  // une manière de mieux organiser notre code. Donc un mot clé seulement peut
  // invoquer des blocs de code spécifique à une tâche. Ici, il s'agit de dessiner
  // une trame
  trame();
}

/////////////////////////// FUNCTIONS ////////////////////////////

void trame() {

  for (int xPos=125; xPos<width-100; xPos+=50) {
    for (int yPos=125; yPos<height-100; yPos+=75) {
      pushMatrix();
      translate(xPos, yPos);
      rotate( angle );
      fill(0);
      noStroke();
      // dessiner nos rectangles
      rect(0, 0, rectSize, rectSize);
      stroke(0);
      // dessiner nos lignes
      line(-lineLn, -lineLn, lineLn, lineLn);

      popMatrix();
    }
  }
}

