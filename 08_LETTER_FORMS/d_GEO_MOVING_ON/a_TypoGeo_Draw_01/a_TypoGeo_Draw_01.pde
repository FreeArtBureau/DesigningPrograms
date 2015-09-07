/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;

RFont font;
String myText = "DRAW";
boolean stopAnime = false;
int xIndex = 0;
int yIndex = 0;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(800, 400);
  background(0);
  noStroke();
  smooth();
  RG.init(this); 
  font = new RFont("AnonymousPro-Bold.ttf", 260, CENTER);
  fill(0,0,255);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(255);
  translate(width/2, height/1.5);

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
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyReleased() {
  if (key == 'f') 
    stopAnime = !stopAnime;
  if (stopAnime == true)
    noLoop(); 
  else loop();
}

