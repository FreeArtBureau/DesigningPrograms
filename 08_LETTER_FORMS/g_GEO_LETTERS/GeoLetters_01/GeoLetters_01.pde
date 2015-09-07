/*
 SKETCH : GEO_LETTERS_01
 PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;
import java.util.*;

RFont font;
RPoint[] myPoints;
String myText = "A";
float xOff;
float yDiff2;
float xDiff2;
float angle;
boolean STOPANIME = false;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(800, 560);
  background(255);
  smooth();
  xOff = 0;
  yDiff2 = height/1.5;
  xDiff2 = width/2;
  angle = 0;
  RG.init(this); 
  font = new RFont("saxmono.ttf", 400, CENTER);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  //background(255);
  fill(255, 0, 0, 10);
  noStroke();
  pushMatrix();
  float yDiff = cos(frameCount*0.0035)*70;
  translate(xOff, height/2+yDiff);
  rotate( radians(angle) );

  //CONFIGURE SEGMENT LENGTH AND MODE
  RCommand.setSegmentLength( 1 );
  
  //GROUP TOGETHER MY FONT & TEXT.
  RGroup myGroup = font.toGroup(myText); 
  
  //ACCESS POINTS ON MY FONT/SHAPE OUTLINE
  RPoint[] myPoints = myGroup.getPoints();
  
  //DRAW ELLIPSES AT EACH OF THESE POINTS
  for (int i=0; i<myPoints.length; i++) {    
    ellipse(myPoints[i].x, myPoints[i].y, 1, 1);
  }
  popMatrix();

  xOff+=0.9;
  angle+=0.8;
  //yDiff2 -= 0.3;
  xDiff2 -= 1.9;
}

//////////////////////////////////////////////

void keyPressed() {
  if (key == 'f')
    STOPANIME = !STOPANIME;
  if (STOPANIME) {
    noLoop();
  } else {
    loop();
  }

  if (key == 'q') {
    setup();
  }
}

