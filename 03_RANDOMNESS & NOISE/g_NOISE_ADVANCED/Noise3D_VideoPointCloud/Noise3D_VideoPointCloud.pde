///////////////////////////////////////
 ++++++++++++++++++++++++++++++++++++++++++
  GRAPHIC SYSTEMS 1.0
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2014 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : CHANCE
 SKETCH : 3D NOISE_03
 PARENT SKETCH : 3D NOISE_02
 TYPE : AUTONOME
 
 **NB
 IN THIS SKETCH WE ADD A MORE ORGANIC MOVEMENT WITH SIN FUNCTIONS
 BASED ON A SKETCH BY ANDREAS GYSIN
 */
 
/////////////////////////// GLOBALS ////////////////////////////
import processing.video.*;
import processing.opengl.*;

Capture cam;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600, P3D);
  cam = new Capture(this,width/2, height/2, 30);
  cam.start();

}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
    cam.read();
  //Grid size of our points
  int numX = cam.width;
  int numY = cam.height; 
  
  //Resolution of points 
  int pnts = 3;
 
  //Center our grid
  float offpntsX = -numX * pnts / 2; 
  float offpntsY = -numY * pnts / 2; 
  translate(width/2, (numY+height/4));
  
  //rotateY(frameCount * 0.005 + mouseX * 0.01);  
  //rotateX(HALF_PI);  
  
  // We have created 2 variables for simulating a smoother 
  // animation using sin functions 
  float snx = sin(frameCount * 0.0007) * 6;
  float sny = sin(frameCount * 0.0003) * 6;

  beginShape(POINTS);
  for (int j=0; j<numY-1; j++) {
    for (int i=0; i<numX-1; i++) {
      color c = cam.get(i,j);
      float b = brightness(c);
      stroke(c);
      //Calculate our x & y coordinates for our points
      float px = offpntsX + i * pnts; 
      float py = offpntsY + j * pnts;
      
      float pz = noise(px * 0.004 + snx, py * 0.004 + sny) * 300;
      point(px, py, pz);
      vertex(px,py,pz*b);

    }
  }
endShape();
}


void captureEvent(Capture cam) {
  cam.read();
}
