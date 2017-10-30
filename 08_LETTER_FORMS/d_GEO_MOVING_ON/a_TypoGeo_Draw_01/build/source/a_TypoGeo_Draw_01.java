import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import geomerative.*; 
import gifAnimation.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class a_TypoGeo_Draw_01 extends PApplet {

/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////



GifMaker gifExport;

RFont font;
String myText = "DRAW";
boolean stopAnime = false;
int xIndex = 0;
int yIndex = 0;

/////////////////////////// SETUP ////////////////////////////
public void setup() {
  
  background(0);
  noStroke();
  
  RG.init(this);
  font = new RFont("AnonymousPro-Bold.ttf", 260, CENTER);
  fill(0,0,255);
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(2);
}

/////////////////////////// DRAW ////////////////////////////
public void draw() {
  //background(255);
  translate(width/2, height/1.5f);

  RCommand.setSegmentLength(3);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  RGroup myGoup = font.toGroup(myText);
  RPoint[] myPoints = myGoup.getPoints();

  // Check myPoints array length & if not max then
  // move to next index in the array. This way we draw
  // an ellipse at each point in a linear manner
  if ((xIndex<myPoints.length-1)&&(yIndex<myPoints.length-1)) {

    ellipse(myPoints[xIndex].x, myPoints[yIndex].y, 5, 5);
    xIndex+=1;
    yIndex+=1;
    gifExport.setDelay(1);
    gifExport.addFrame();

  }else {
    finishGif();
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
public void finishGif(){
  gifExport.finish();
  println("gif saved");
}

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
 LETTER FORMS : GEO BASIC
 SKETCH : TYPEGEO_DRAW_01
 PARENT SKETCH : NONE
 TYPE : AUTONOMOUS
 
 **NB

 */

  public void settings() {  size(800, 400);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "a_TypoGeo_Draw_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
