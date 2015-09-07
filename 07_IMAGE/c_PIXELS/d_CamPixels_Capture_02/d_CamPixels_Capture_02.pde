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
  rectMode(CENTER);
  // Ces lignes de code récupère la caméra branchée à l'ordinateur
  // qui permet de debugger éventuellement
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    // Fin de code pour afficher les infos cam.
    //--------------------------------------------------

    // Nouvelle capture 
    cam = new Capture(this, width, height, 12);
    cam.start(); // Add this for P5 V2 ++
    cam.read();
  }
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

      // Récupère les valeurs colorimétriques pour RVB de l'image
      float rVal =  red(cam.pixels[pos]);
      float gVal =  green(cam.pixels[pos]);
      float bVal =  blue(cam.pixels[pos]);
      
      // Créer une nouvelle couleur avec les valeurs RVB
      color c = color(rVal, gVal, bVal);
      // Attribuer cette variable à nos pixels
      cam.pixels[pos] = c;

      // Pixelate
      float rectSize = map(mouseY, 0, height, 1, 20);
      fill(c);
      rect(x,y,rectSize,rectSize);
    }
  }
  // On a besoin de mettre à jour l'affichage des pixels
  // grace à cette fonction
  cam.updatePixels();

  //  println(frameRate); // pour debugger et voir la vitesse
}

