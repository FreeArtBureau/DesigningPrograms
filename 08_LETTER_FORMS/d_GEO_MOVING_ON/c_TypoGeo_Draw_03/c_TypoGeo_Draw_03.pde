/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////
import geomerative.*;

RFont font;
String myText = "ATHEN";
int xIndex, yIndex;
int step = 1;
int len = 40;
boolean stopAnime = false;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(900, 400);
  background(0);
  smooth();
  RG.init(this);
  font = new RFont("AnonymousPro-Bold.ttf", 260, CENTER);
}



/////////////////////////// DRAW ////////////////////////////
void draw() {
  translate(width/2, height/1.5);

  RCommand.setSegmentLength(1);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  RGroup myGroup = font.toGroup(myText);
  RPoint[] myPoints = myGroup.getPoints();

  // Calculate distance between 
  float d = dist(myPoints[xIndex+len].x, myPoints[xIndex].y, myPoints[xIndex].x, myPoints[xIndex+len].y);

  if ((xIndex<myPoints.length-1)&&(yIndex<myPoints.length-1)) {

    if (d <=len+1) { 
      stroke(255);
      strokeWeight(0.6);
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
void keyReleased() {
  if (key == 'f') 
    stopAnime = !stopAnime;
  if (stopAnime == true)
    noLoop(); 
  else loop();
}

