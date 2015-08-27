
///////////////////////////////////////
/*REFBOOK : Chance
 ++++++++++++++++++++++++++++++++++++++++++
 GRAPHIC SYSTEMS 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2010/11 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : CHANCE
 SKETCH : NOISE3D_VIDEO POINT CLOUD_02
 PARENT SKETCH : NOISE3D_VIDEO POINT CLOUD_01
 TYPE : AUTONOME
 
 **NB
 IN THIS SKETCH WE ADD A MORE ORGANIC MOVEMENT WITH SIN FUNCTIONS
 BASED ON A SKETCH BY ANDREAS GYSIN
 */

/////////////////////////// GLOBALS ////////////////////////////
import processing.pdf.*;
import processing.video.*;

Capture cam;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600, P3D);
  cam = new Capture(this, width/2, height/2, 30);
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

  rotateY(mouseX * 0.01);  
  float my = map(mouseY, 0, height, 0, TWO_PI);
  rotateX(my);  

  // We have created 2 variables for simulating a smoother 
  // animation using sin functions 
  float snx = sin(frameCount * 0.0007) * 6;
  float sny = sin(frameCount * 0.0003) * 6;

  for (int j=0; j<numY-1; j++) {
    for (int i=0; i<numX-1; i++) {
      color c = cam.get(i, j);
      float b = brightness(c);
      stroke(c);
      //stroke(b);
      //Calculate our x & y coordinates for our points
      float px = offpntsX + i * pnts; 
      float py = offpntsY + j * pnts;

      float pz = noise(px * 0.004 + snx, py * 0.004 + sny) * (2*b);
      point(px, py, pz);
      //point(px, py, b);
    }
  }
}


void captureEvent(Capture cam) {
  cam.read();
}

void keyPressed() {
 if(key == 'r')
beginRaw(PDF,"blah.pdf"); 
if(key == 'e')
endRaw();
  
  
  
}
