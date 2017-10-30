import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import geomerative.*; 
import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GeoLetters_01 extends PApplet {

/*
 SKETCH : GEO_LETTERS_01
 PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////




RFont font;
RPoint[] myPoints;
String myText = "A";
float xOff;
float yDiff2;
float xDiff2;
float angle;
boolean STOPANIME = false;

/////////////////////////// SETUP ////////////////////////////
public void setup() {
  
  background(255);
  
  xOff = 0;
  yDiff2 = height/1.5f;
  xDiff2 = width/2;
  angle = 0;
  RG.init(this);
  font = new RFont("saxmono.ttf", 400, CENTER);
}

/////////////////////////// DRAW ////////////////////////////

public void draw() {
  //background(255);
  fill(255, 0, 0, 10);
  noStroke();
  pushMatrix();
  float yDiff = cos(frameCount*0.0035f)*70;
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

  xOff+=0.9f;
  angle+=0.8f;
  //yDiff2 -= 0.3;
  xDiff2 -= 1.9f;
}

//////////////////////////////////////////////

public void keyPressed() {
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
///////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2012/13 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LETTER FORMS : GEO LETTERS
 SKETCH : GEO_LETTERS_01
 PARENT SKETCH : NONE
 TYPE : AUTONOMOUS
 
 **NB
 
 In this series of sketches we develop a class that will be used
 to create letters using geomerative. The class will give us the
 possibility to initiate a new letter with a number of parameters
 for movement and eventually display (eg. number of points...)

 */

  public void settings() {  size(800, 560);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GeoLetters_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
