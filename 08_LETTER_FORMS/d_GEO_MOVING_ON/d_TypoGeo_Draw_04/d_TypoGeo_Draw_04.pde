/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;

RFont font;
RPoint[] myPoints;
String myText = "DRAW";
boolean stopAnime = false;
int xIndex = 0;
int yIndex = 0;
// Change these values to get different graphic results
float freq = 0.005; // changes frequency of sine oscillation
float amp = 30; // changes amplitude of oscillation (ellipse size)

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(800, 400);
  colorMode(HSB, 360, 100, 100);
  background(10, 0, 0);
  noStroke();
  smooth();
  RG.init(this); 
  font = new RFont("AnonymousPro-Bold.ttf", 260, CENTER);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(255);
  translate(width/2, height/1.5);

  fill(frameCount%360, 100, 100); // change HUE with frameCount
  float dia = sin(frameCount*freq) * amp;

  RCommand.setSegmentLength(3);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  RGroup myGoup = font.toGroup(myText); 
  myPoints = myGoup.getPoints();

  // Check myPoints array length & if not max then
  // move to next index in the array. This way we draw
  // an ellipse at each point in a linear manner
  if ((xIndex<myPoints.length-1)&&(yIndex<myPoints.length-1)) {

    ellipse(myPoints[xIndex].x, myPoints[yIndex].y, dia, dia);
    xIndex+=1;
    yIndex+=1;
  }
  checkIndex();
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyReleased() {
  if (key == 'f') 
    stopAnime = !stopAnime;
  if (stopAnime == true)
    noLoop(); 
  else loop();
}

// Added little function to check end of points index
void checkIndex() {
  if ((xIndex==myPoints.length-1)||(yIndex==myPoints.length-1)) {
    delay(1000);
    saveFrame("capture_###.png"); // save image
    background(10, 0, 0);
    xIndex = 0;
    yIndex = 0;
  }
}

