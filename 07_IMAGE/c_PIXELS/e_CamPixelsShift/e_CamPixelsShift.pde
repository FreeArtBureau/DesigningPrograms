/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

import processing.video.*;
Capture cam; // Nouvel objet pour notre caméra
import controlP5.*;
ControlP5 INTERFACES;
float LINELEN;

int INDEXRED, INDEXGREEN, INDEXBLUE, TRAMEX, TRAMEY;
;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480);
  noStroke();
  ControlInit();
  LINELEN = 10;
  // Nouvelle capture 
  cam = new Capture(this, width, height, 12);
  cam.start();
}


/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  if (cam.available() == true) {
    cam.read();
  }
  // Cette fonction est nécessaire pour charger les pixels
  // dans la mémoire
  cam.loadPixels(); // On a aussi besoin de charger les pixels de la caméra

  for (int x=0; x<cam.width-1; x+=TRAMEX) {
    for (int y=0; y<cam.height-1; y+=TRAMEY) {
      int pos = (y * cam.width) + x;

      // Récupère les valeurs colorimétrique pour RVB de l'image
      float rVal =  red(cam.pixels[pos + INDEXRED]);
      float gVal =  green(cam.pixels[pos + INDEXGREEN]);
      float bVal =  blue(cam.pixels[pos + INDEXBLUE]);

      // Change brightness according to the mouse here
      float pixelBright = ((float) mouseX / width) * 8.0;
      // Mettre à jour nos valeurs rVal, gVal, bVal
      rVal *= pixelBright;
      gVal *= pixelBright;
      bVal *= pixelBright;
      // Contraindre RGB entre 0-255
      rVal = constrain(rVal, 0, 255);
      gVal = constrain(gVal, 0, 255);
      bVal = constrain(bVal, 0, 255);

      // Créer une nouvelle couleur & attribuer les valeurs
      color c = color(rVal, gVal, bVal);
      cam.pixels[pos] = c;

      // float xCrossLen = pixelBright/10 + (pixelBright * LINELEN);
      float xCrossLen = map(mouseY, 0, height, 1, 30);
      xCross(x, y, xCrossLen, c);
      
      // Carrés ( désactive aussi la ligne xCross(x, y, xCrossLen, c); )
      //fill(c);
      //rect(x,y,xCrossLen,xCrossLen); // Attention, j'ai utilsé la var xCrossLen pour la taille du carré
    }
  }

  // On a besoin de mettre à jour l'affichage des pixels
  // grace à cette fonction
  cam.updatePixels();

  //  println(frameRate); // pour debugger et voir la vitesse
}

/////////////////////////// FUNCTIONS ////////////////////////////

// Fonction pour dessiner un croix
void xCross(int x, int y, float len, color c) {
  pushMatrix();
  translate(x, y);
  stroke(c);
  strokeWeight(0.3);
  line(-len, -len, +len, +len); 
  line(-len, +len, +len, -len);
  popMatrix();
}

