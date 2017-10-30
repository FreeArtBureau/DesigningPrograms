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

public class Geo_FontAgentClass_04b extends PApplet {

/*
PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////




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

public void setup() {
  
  background(0);
  strokeWeight(0.3f);
  

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

public void draw() {
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

public void keyPressed() {
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
// & setup is called on each new keyPressed ;\u2013)
public String initText() {
  word = n;
  if (key == '1') word = n;
  if (key == '2') word = s;
  if (key == '3') word = m;
  if (key == '4') word = r;
  return word;
}
///////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 GRAPHIC SYSTEMS 1.0 (2015)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2012/13 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 TYPO : GEOMERATIVE
 SKETCH : GEO_FONTAGENT_CLASS_04b
 PARENT SKETCH : GEO_FONTAGENT_CLASS_04
 TYPE : DYNAMIQUE
 
 **NB
 */


class FontAgent {
  float x, y;
  float motion;


  FontAgent(float x, float y) {
    this.x = x;
    this.y = y;
  } 

  public void render() {
    // noFill();
    //stroke(0); 
    noStroke();
    fill(255, 53);
    ellipse(x, y, motion, motion);
  }


  //ORIGINAL NOISE ALGO [very little diff between this and algo 3]
  public void animate1() {

     // it's really a verbose & criptic way to write this Andreas !
    motion = noise(x * 0.01f + sin(frameCount * 0.0013f)*7, y * 0.01f + sin(frameCount * 0.0013f)*7) * 56;
  }
  
  // WITH noiseZ [very little diff between this and algo 4]
  public void animate2(float nAMM) {
    
  float noiseScale = 0.007f; //Smaller numbers give less variation in the noise val.
  float noiseZ = frameCount*0.004f;//Greater numbers will make the motion more nervous.

    motion = noise(x * noiseScale, y * noiseScale, noiseZ) * nAMM;//Last number will increase ellipse diameter
  }

  //MULTIPLYING noiseZ
  // 
  public void animate3(float nAMM) {
    
  float noiseScale = 0.007f; //Smaller numbers give less variation in the noise val.
  float noiseZ = frameCount*0.004f;//Greater numbers will make the motion more nervous.

    motion = noise(x * noiseScale * noiseZ, y * noiseScale * noiseZ) * nAMM;
  }
  //ADDING noiseZ
  // 
  public void animate4(float nAMM) {
    
  float noiseScale = 0.007f; //Smaller numbers give less variation in the noise val.
  float noiseZ = frameCount*0.004f;//Greater numbers will make the motion more nervous.

    motion = noise(x * noiseScale + noiseZ, y * noiseScale + noiseZ) * nAMM;
  }
}



/*
STUDY THESE METHODS CAREFULLY & EXPLAIN THEM
 
 
 void animate2() {
 float offs = frameCount * 0.04 + (x + y) * 0.01; // THIS CALCULATION IS INTERESTING WITH THE X & Y
 finalDia = sin(offs) * 13 + 23 * 1.2;
 } 
 
 void animate3() {
 float noiseScaler = 0.008; //if this number gets smaller the circles will look more similar in size
 float ang = frameCount * 0.01; //if this number gets bigger the movement will be more nervous... play around!
 float rad = width/2;// WHAT IS THIS DOING ?
 
 // AND HERE TOO THE x + & then * rad is interesting. 
 float nx = (x + cos(ang) * rad) * noiseScaler; 
 float ny = (y + sin(ang) * rad) * noiseScaler;
 finalDia = noise(nx, ny) * 33 + 10; //for more variation you could still add a z in noise...
 }
 
 
 */
  public void settings() {  size(900, 400);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Geo_FontAgentClass_04b" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
