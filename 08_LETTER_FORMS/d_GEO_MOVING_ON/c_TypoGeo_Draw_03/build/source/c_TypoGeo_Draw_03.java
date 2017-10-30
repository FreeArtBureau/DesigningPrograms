import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import geomerative.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class c_TypoGeo_Draw_03 extends PApplet {

/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////


RFont font;
String myText = "A";
int xIndex, yIndex;
int step = 5;
int len = 100;
boolean stopAnime = false;

/////////////////////////// SETUP ////////////////////////////
public void setup() {
  
  background(0);
  
  RG.init(this);
  font = new RFont("AnonymousPro-Bold.ttf", 360, CENTER);
}



/////////////////////////// DRAW ////////////////////////////
public void draw() {
  translate(width/2, height/1.5f);

  RCommand.setSegmentLength(1);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  RGroup myGroup = font.toGroup(myText);
  RPoint[] myPoints = myGroup.getPoints();

  // Calculate distance between
  float d = dist(myPoints[xIndex+len].x, myPoints[xIndex].y, myPoints[xIndex].x, myPoints[xIndex+len].y);

  if ((xIndex<myPoints.length-1)&&(yIndex<myPoints.length-1)) {

    if (d <=len+1) {
      stroke(255);
      strokeWeight(0.6f);
      line(myPoints[xIndex+len].x, myPoints[yIndex].y, myPoints[xIndex].x, myPoints[yIndex+len].y);
    } else
    {
      line(myPoints[xIndex].x, myPoints[yIndex].y, myPoints[xIndex].x, myPoints[yIndex].y);

      /*fill(0,0,255);
       noStroke();
       ellipse(myPoints[xIndex].x, myPoints[yIndex].y, 10, 10);
       */
    }
    xIndex+=step;
    yIndex +=step;
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
public void keyReleased() {
  if (key == 'f')
    stopAnime = !stopAnime;
  if (stopAnime == true)
    noLoop();
  else loop();
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
 LETTER FORMS : GEO BASICS
 SKETCH : TYPEGEO_DRAW_03
 PARENT SKETCH : NONE
 TYPE : AUTONOMOUS
 
 **NB

 */

  public void settings() {  size(900, 400);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "c_TypoGeo_Draw_03" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
