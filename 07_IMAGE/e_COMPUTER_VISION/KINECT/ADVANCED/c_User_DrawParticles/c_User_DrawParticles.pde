/*
 * :::::::::::::::
 * COMPUTER VISION
 * :::::::::::::::
 *
 * Kinect User_DrawParticles
 * Demonstrates how to detect users and draw a particle system with the hand
 *
 *
 * 3DSense
 * Links : http://blog.3dsense.org/programming/programming-for-kinect-4-kinect-app-with-skeleton-tracking-openni-2-0/
 * NI version 1.96
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////

import SimpleOpenNI.*; 

SimpleOpenNI  kinect; 
PImage img;

Particle[] pickles = new Particle[0]; 
int maxParticles = 10000;
boolean USER_DETECTED;


/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(640, 480); 
  smooth();
  noStroke();
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth(); 

  //asks OpenNI to initialize and start receiving User data
  kinect.enableUser(); 
  kinect.setMirror(true);  
  img=createImage(640, 480, RGB);
  img.loadPixels();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0, 50); 
  //asks kinect to send new data
  kinect.update();

  // DETECT USER (WITHOUT DEPTH IMAGE:DEBUG MODE) 
  detectUser(false);


  // TRACK BODY PARTS
  drawSkeletonParts();
  
  if(USER_DETECTED) {
  // Add particles
  addParticles(projRHand); // J'ai crée une fonction pour ceci - plus clair. 

  // update and draw all the particles
  for (int i=0; i<pickles.length; i++) {
    pickles[i].drawParticles(); // Voir la classe - Cette nouvelle méthode réunit tous les méthodes de la classe en une.
  }

  limitParticles(); // J'ai aussi écrit une fonction pour ceci - voir l'onglet FUNCTIONS
  }
}

