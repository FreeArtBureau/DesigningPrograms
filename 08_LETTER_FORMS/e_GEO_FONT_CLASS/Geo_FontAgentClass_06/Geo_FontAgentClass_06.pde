/*
PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////


import geomerative.*;
import java.util.*;

RFont font;
RGroup myGroup;
RPoint[] myPoints;
String myText = "MOUSE";
FontAgent[] myFontAgents;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(850, 300);
  background(0);
  smooth();
  RG.init(this); 
  font = new RFont("FreeSans.ttf", 145, CENTER);
  RCommand.setSegmentLength(5);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  myGroup = font.toGroup(myText);
  myPoints = myGroup.getPoints();

  myFontAgents = new FontAgent[myPoints.length];

  for (int i=0; i<myPoints.length; i++) {
    myFontAgents[i]= new FontAgent(myPoints[i].x, myPoints[i].y, 1);
  }
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  translate(width/2, height/1.7);

  for (int i = 0; i < myPoints.length; i++) {

    myFontAgents[i].render();
    //myFontAgents[i].animate1();
    myFontAgents[i].interaction();
  }
}

//////////////////////////////////////////////

