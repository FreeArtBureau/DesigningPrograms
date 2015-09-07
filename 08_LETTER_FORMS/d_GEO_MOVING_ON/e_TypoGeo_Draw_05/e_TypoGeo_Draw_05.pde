/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////
import geomerative.*;

RFont font;
RPoint[] pnts;
String myText = "VECTOR";
int index;
int step = 7;
float diaFreq = 0.55;
float diaMax = 5;

FontAgent[] vec;
boolean stopAnime = false;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(960, 400);
  background(0);
  smooth();
  RG.init(this);
  font = new RFont("AlteHaasGroteskBold.ttf", 220, CENTER);

  RCommand.setSegmentLength(1);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  RGroup myGroup = font.toGroup(myText);
  pnts = myGroup.getPoints();

  // Initialiser nos vecteurs
  vec = new FontAgent[pnts.length];
  for (int i=0; i<pnts.length; i++) {
    vec[i] = new FontAgent(pnts[i].x, pnts[i].y);
  }
}



/////////////////////////// DRAW ////////////////////////////
void draw() {

  translate(width/2, height/1.4);

  if (index<pnts.length-1) {
    
    float dia = sin(frameCount * diaFreq) * diaMax;
    vec[index].render(dia);
    index+=step;
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

