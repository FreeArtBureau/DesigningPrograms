/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

import processing.video.*;
Capture cam; // Nouvel objet pour notre caméra

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480, P2D);
  // Ces lignes de code récupère la caméra branchée à l'ordinateur
  // qui permet de debugger éventuellement
  String[] cameras = Capture.list();
  if (cameras.length == 0)
  {
    println("There are no cameras available for capture.");
    exit();
  }
  else
  {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    // Fin de code pour afficher les infos cam.
    //--------------------------------------------------

    // Nouvelle capture 
    cam = new Capture(this, width, height, 12);
    cam.read();
    cam.start(); // rajouter cette ligne si en Processing V2 +
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  // Cette fonction est nécessaire pour charger les pixels
  // dans la mémoire
  loadPixels();
  cam.loadPixels(); // On a aussi besoin de charger les pixels de la caméra

  for (int x=0; x<cam.width; x++) {
    for (int y=0; y<cam.height; y++) {
      int pos = (y * cam.width) + x;

      // Récupère les valeurs colorimétrique pour RVB de l'image
      float rVal =  red(cam.pixels[pos]);
      float gVal =  green(cam.pixels[pos]);
      float bVal =  blue(cam.pixels[pos]);

      pixels[pos] = color(rVal, gVal, bVal);
    }
  }

  // On a besoin de mettre à jour l'affichage des pixels
  // grace à ces fonctions
  cam.updatePixels();
  updatePixels();

  //  println(frameRate); // pour debugger et voir la vitesse
}

