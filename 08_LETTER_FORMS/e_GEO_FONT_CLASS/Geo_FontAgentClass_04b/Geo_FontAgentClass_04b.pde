/*
PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////


import geomerative.*;

RPoint[] myPoints;
FontAgent[] myFontAgents;
boolean stopAnime = false;
PFont f;

int MODE = 1; // animation modes
String tx; // interface text to display
String n = "NORM";
String s = "NOISEZ";
String m = "MULTIPLY";
String r = "ADDING";
String word;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(900, 400);
  background(0); 
  strokeWeight(0.3);
  smooth();

  //------------- Interface Text
  tx = "Press keys 1/2/3/4\n1 = animatation 1\n2 = animatation 2\n3 = animatation 3\n4 = animatation 4";
  f = createFont("FiraSans-Light", 12);
  textFont(f, 12);
  // Initialise word
  word = initText();

  RG.init(this);
  RFont myFont = new RFont("FreeSans.ttf", 145, RFont.CENTER);
  RCommand.setSegmentLength(5);
  RGroup myGroup = myFont.toGroup(word);
  myPoints = myGroup.getPoints();

  myFontAgents = new FontAgent[myPoints.length];
  for (int i=0; i<myPoints.length; i++) {
    myFontAgents[i] = new FontAgent(myPoints[i].x, myPoints[i].y);
  }
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0, 150);
  fill(0, 33);
  rect(0, 0, width, height);
  
  fill(255);
  text(tx, 20, 40); // interface text
  translate(width/2, 250);

  // var for effect scale
  float nAmm = map(mouseX, 0, width, 1, 200);
  
  
  for (int i=0; i<myPoints.length; i++) {

    // different animation modes :
    if (MODE == 1) {
      myFontAgents[i].animate1();
    }

    if (MODE == 2) {
      myFontAgents[i].animate2(nAmm);
    }
       if (MODE == 3) {
      myFontAgents[i].animate3(nAmm);
    }

    if (MODE == 4) {
      myFontAgents[i].animate4(nAmm);
    }

    myFontAgents[i].render();
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
  if (key == 'f' || key == 'F') {
    stopAnime = !stopAnime;
    if (stopAnime == true)
      noLoop();
    else loop();
  }

  if (key == '1') {
    setup();
    MODE = 1;
  }

  if (key == '2') {
    setup();
    MODE = 2;
  }
  if (key == '3') {
    setup();
    MODE = 1;
  }

  if (key == '4') {
    setup();
    MODE = 2;
  }
}

// Returns corresponding word to display
// NOTE this function is called in setup()
// & setup is called on each new keyPressed ;–)
String initText() {
  word = n;
  if (key == '1') word = n;
  if (key == '2') word = s;
  if (key == '3') word = m;
  if (key == '4') word = r;
  return word;
}

