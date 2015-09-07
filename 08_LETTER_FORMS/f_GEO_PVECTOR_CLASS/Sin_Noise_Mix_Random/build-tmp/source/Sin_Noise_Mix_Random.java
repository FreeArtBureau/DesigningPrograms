import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import geomerative.*; 
import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Sin_Noise_Mix_Random extends PApplet {

/*
///////////////////////////////////////////////
 --------- GEOMERATIVE EXAMPLES ---------------
 //////////////////////////////////////////////
 Title   :   TypoGeo_Class_01_Deformb
 Date    :   31/08/2011 
 Version :   v0.5
 
 This sketch deforms the text using noise as the underlying 
 algorithm. There are 3 noise modes :
 Key '1' = Noise
 Key '2' = Sinus
 Key '3' = Combined
 key '4' = Random
 
 Key 'f' = Switches animation on/off
 Key 'c' = Switches between fill/contour
 
 Licensed under GNU General Public License (GPL) version 3.
 http://www.gnu.org/licenses/gpl.html
 
 A series of tutorials for using the Geomerative Library
 developed by Ricard Marxer. 
 http://www.ricardmarxer.com/geomerative/
 
 More info on these tutorials and workshops at :
 www.freeartbureau.org
 
 Many thanks to Andreas Gysin for helping out on
 the code and suggesting various modes.
 http://www.ertdfgcvb.ch/
 
 */
//////////////////////////////////////////////




RPoint[] myPoints; 
FontAgent[] myAgents;
PFont f; // Font for interface

int mode = 1;
boolean stopAnime, contour = true;
String n = "NOISE";
String s = "SINUS";
String m = "MIX:N+S";
String r = "RANDOM";
String word;
String tx; // Interface text
//----------------SETUP---------------------------------
public void setup() {
  size(720, 350);
  background(0, 33); 
  strokeWeight(0.3f);
  smooth();
  //--------INITIALIZE GEO LIBRARY
  RG.init(this); 

  RFont myFont = new RFont("Lekton-Bold.ttf", 165, RFont.CENTER);
  word = initText();
  RCommand.setSegmentLength(2);
  RGroup myGroup = myFont.toGroup(word);

  //--------GRAB OUR POINTS
  myPoints = myGroup.getPoints();

  myAgents = new FontAgent[myPoints.length];
  for (int i=0; i<myPoints.length; i++) {
    myAgents[i] = new FontAgent(myPoints[i].x, myPoints[i].y);
  }
  
  //------------- Interface Text
  tx = "Press keys 1/2/3/4\n1 = Noise\n2 = Sinus\n3 = Mix\n4 = Random \nPress c \n(& again)";
  f = loadFont("Lekton04-Thin-12.vlw");
  textFont(f,12);
}

//----------------DRAW---------------------------------

public void draw() {
  background(0, 33);
  fill(255, 33);
  rect(0, 0, width, height);
  fill(255);
  text(tx,20,40); // interface text
  translate(width/2, 230);
  
  // ---------------- Geomerative aniamted texts
  if (mode == 1) {
    for (int i=0; i<myPoints.length; i++) {
      myAgents[i].display();
      myAgents[i].animate1();
    }
  }
  if (mode == 2) {
    for (int i=0; i<myPoints.length; i++) {
      myAgents[i].display();
      myAgents[i].animate2();
    }
  }
  if (mode == 3) {
    for (int i=0; i<myPoints.length; i++) {
      myAgents[i].display();
      myAgents[i].animate3();
    }
  }

  if (mode == 4) {
    for (int i=0; i<myPoints.length; i++) {
      myAgents[i].display();
      myAgents[i].animate4();
    }
  }
}

//----------------KEYS---------------------------------
public void keyReleased() {
  if (key == '1') {
    setup();
    mode = 1;
  }
  if (key == '2') {
    setup();
    mode = 2;
  }
  if (key == '3') {
    setup();
    mode = 3;
  }
  if (key == '4') {
    setup();
    mode = 4;
  }
}

public String initText() {
  word = n;
  if (key == '1') word = n;
  if (key == '2') word = s;
  if (key == '3') word = m;
  if (key == '4') word = r;
  return word;
}
public void keyPressed() {
  if (key == 'f' || key == 'F') 
    stopAnime = !stopAnime;//Check what ! does.
  if (stopAnime == true)
    noLoop();
  else loop();

  if (key == 'c' || key == 'C')
    contour = !contour;

  if (key == 's' || key == 'S') {
    saveFrame("images/image"+(new Date().getTime())+".tiff");
    println("save TIFF");
  }
}


class FontAgent { 

  float x, y;
  float finalDia;

  FontAgent(float x, float y) {  
    this.x = x; 
    this.y = y; 
    // this.dia = dia;
  } 

  public void display() {
    //noFill();
    if(contour == false) {
    noStroke();
    fill(255, 33);
    }
    else {
      strokeWeight(0.3f);
     stroke(255);
    noFill(); 
    }
    //stroke(0); 
    ellipse(x, y, finalDia, finalDia);
  }

  public void animate1() {

    float noiseScaler = 0.009f;
    float z = frameCount*0.007f;
    finalDia = noise(x * noiseScaler, y * noiseScaler, z)*53;
  }

  public void animate2() {
    float offs = frameCount * 0.04f + (x + y) * 0.01f;
    finalDia = sin(offs) * 13 + 23 * 1.2f;
  } 

  public void animate3() {
    float noiseScaler = 0.008f; //if this number gets smaller the circles will look more similar in size
    float ang = frameCount * 0.01f; //if this number gets bigger the movement will be more nervous... play around!
    float rad = width/2;
    float nx = (x + cos(ang) * rad) * noiseScaler;
    float ny = (y + sin(ang) * rad) * noiseScaler;
    finalDia = noise(nx, ny) * 33 + 10; //for more variation you could still add a z in noise...
  }
  
    public void animate4() {
    float offs = (frameCount%500) * 0.09f + (x + y) * 0.02f;
    finalDia = random(offs);
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#030303", "--hide-stop", "Sin_Noise_Mix_Random" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
