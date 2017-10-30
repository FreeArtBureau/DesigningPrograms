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

public class b_TypoGeo_Draw_02 extends PApplet {

/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////


RFont font;
String myText = "DEPTH";
int xIndex, yIndex;
int step = 1;
int len = 40;
boolean stopAnime = false;

/////////////////////////// SETUP ////////////////////////////
public void setup() {
  
  background(0);
  
  RG.init(this);
  font = new RFont("AnonymousPro-Bold.ttf", 260, CENTER);
}



/////////////////////////// DRAW ////////////////////////////
public void draw() {
 translate(width/2, height/1.5f);

 RCommand.setSegmentLength(10);
 RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

 RGroup myGroup = font.toGroup(myText);
 RPoint[] myPoints = myGroup.getPoints();

   if ((xIndex<myPoints.length-1)&&(yIndex<myPoints.length-1)) {
    stroke(255);
    strokeWeight(1);
    line(myPoints[xIndex].x, myPoints[yIndex].y,myPoints[xIndex].x+len, myPoints[yIndex].y+len);

    fill(0,0,255);
    noStroke();
    ellipse(myPoints[xIndex].x, myPoints[yIndex].y, 10, 10);

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
 LETTER FORMS : GEO MOVING ON
 SKETCH : TYPEGEO_DRAW_02
 PARENT SKETCH : NONE
 TYPE : AUTONOMOUS
 
 **NB

 */

  public void settings() {  size(900, 400);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "b_TypoGeo_Draw_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
