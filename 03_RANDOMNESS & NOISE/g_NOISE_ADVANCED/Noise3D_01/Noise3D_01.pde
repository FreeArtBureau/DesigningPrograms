/*
///////////////////////////////////////
 ++++++++++++++++++++++++++++++++++++++++++
 GRAPHIC SYSTEMS 1.0
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : CHANCE
 SKETCH : 3D NOISE_01
 PARENT SKETCH :
 TYPE : AUTONOME
 
 **NB
 */
 
/////////////////////////// GLOBALS ////////////////////////////
import processing.opengl.*;
/////////////////////////// SETUP ///////////////////////////  /

void setup() {
  size(800, 500, OPENGL);
}


/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  
  //TGrid size of our points
  int numX = 100;
  int numY = 100; 
  
  //Resolution of points 
  int pnts = 5;
  
  //Center our grid
  float offpntsX = -numX * pnts / 2; // Returns -200
  float offpntsY = -numY * pnts / 2; 
  translate(width/2, height/2-(numY/2)); 
  
  stroke(255);  
  for (int j=0; j<numY-1; j++) {
    for (int i=0; i<numX-1; i++) {
      
      //Calculate our x & y coordinates for our points
      float px = offpntsX + i * pnts; // Returns x coordinates between -200 & 200 : -200+0*4 = -200  / -200+100*4 = 200
      float py = offpntsY + j * pnts;
      float pz = noise(px * 0.004, py * 0.004, frameCount*0.004) * 300;
      
      point(px, py, pz);
    }
  }
//  println(frameCount);
}

