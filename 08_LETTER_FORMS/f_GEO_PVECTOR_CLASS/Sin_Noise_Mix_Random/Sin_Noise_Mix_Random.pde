/*
///////////////////////////////////////////////
 --------- GEOMERATIVE EXAMPLES ---------------
 //////////////////////////////////////////////
 Title   :   TypoGeo_Class_01_Deformb
 Date    :   31/08/2011 
 Version :   v0.5
 
 This sketch deforms the text using noise as the underlying 
 algorithm. There are 3 noise modes :
 Key '1' = Noise
 Key '2' = Sinus
 Key '3' = Combined
 key '4' = Random
 
 Key 'f' = Switches animation on/off
 Key 'c' = Switches between fill/contour
 
 Licensed under GNU General Public License (GPL) version 3.
 http://www.gnu.org/licenses/gpl.html
 
 A series of tutorials for using the Geomerative Library
 developed by Ricard Marxer. 
 http://www.ricardmarxer.com/geomerative/
 
 More info on these tutorials and workshops at :
 www.freeartbureau.org
 
 Many thanks to Andreas Gysin for helping out on
 the code and suggesting various modes.
 http://www.ertdfgcvb.ch/
 
 */
//////////////////////////////////////////////

import geomerative.*;
import java.util.*;

RPoint[] myPoints; 
FontAgent[] myAgents;
PFont f; // Font for interface

int mode = 1;
boolean stopAnime, contour = true;
String n = "NOISE";
String s = "SINUS";
String m = "MIX:N+S";
String r = "RANDOM";
String word;
String tx; // Interface text
//----------------SETUP---------------------------------
void setup() {
  size(720, 350);
  background(0, 33); 
  strokeWeight(0.3);
  smooth();
  //--------INITIALIZE GEO LIBRARY
  RG.init(this); 

  RFont myFont = new RFont("Lekton-Bold.ttf", 165, RFont.CENTER);
  word = initText();
  RCommand.setSegmentLength(2);
  RGroup myGroup = myFont.toGroup(word);

  //--------GRAB OUR POINTS
  myPoints = myGroup.getPoints();

  myAgents = new FontAgent[myPoints.length];
  for (int i=0; i<myPoints.length; i++) {
    myAgents[i] = new FontAgent(myPoints[i].x, myPoints[i].y);
  }

  //------------- Interface Text
  tx = "Press keys 1/2/3/4\n1 = Noise\n2 = Sinus\n3 = Mix\n4 = Random \nPress c \n(& again)";
  f = loadFont("Lekton04-Thin-12.vlw");
  textFont(f, 12);
}

//----------------DRAW---------------------------------

void draw() {
  background(0, 33);
  fill(255, 33);
  rect(0, 0, width, height);
  fill(255);
  text(tx, 20, 40); // interface text
  translate(width/2, 230);

  // ---------------- Geomerative aniamted texts

  for (int i=0; i<myPoints.length; i++) {

    if (mode == 1) {
      myAgents[i].animate1();
    }
    if (mode == 2) {
      myAgents[i].animate2();
    }

    if (mode == 3) {
      myAgents[i].animate3();
    }

    if (mode == 4) {
      myAgents[i].animate4();
    }
    myAgents[i].display();
  }
}

//----------------KEYS---------------------------------
void keyReleased() {
  if (key == '1') {
    setup();
    mode = 1;
  }
  if (key == '2') {
    setup();
    mode = 2;
  }
  if (key == '3') {
    setup();
    mode = 3;
  }
  if (key == '4') {
    setup();
    mode = 4;
  }
}

String initText() {
  word = n;
  if (key == '1') word = n;
  if (key == '2') word = s;
  if (key == '3') word = m;
  if (key == '4') word = r;
  return word;
}
void keyPressed() {
  if (key == 'f' || key == 'F') 
    stopAnime = !stopAnime;//Check what ! does.
  if (stopAnime == true)
    noLoop();
  else loop();

  if (key == 'c' || key == 'C')
    contour = !contour;

  if (key == 's' || key == 'S') {
    saveFrame("images/image"+(new Date().getTime())+".tiff");
    println("save TIFF");
  }
}

