import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import geomerative.*; 
import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class PV_Geo_Class_03 extends PApplet {

/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////


boolean PDFSAVE = false;

RFont a;
RGroup grp;
RPoint[] pnts;
FontAgent[] vec;
boolean freeze = false;
/////////////////////////// SETUP ////////////////////////////

public void setup() {
  
  background(0);
  

  // Initialiser geomerative
  RG.init(this);
  RCommand.setSegmentLength(1);
  a = new RFont("AlteHaasGroteskBold.ttf", 200);
  grp = a.toGroup("GROWTH");
  pnts = grp.getPoints();

  // Initialiser nos vecteurs
  vec = new FontAgent[pnts.length];
  for (int i=0; i<pnts.length;i++) {
    vec[i] = new FontAgent(pnts[i].x, pnts[i].y);
  }
}

/////////////////////////// DRAW ////////////////////////////
public void draw() {
  translate(100, height/1.5f);

  for (int i=0; i<pnts.length;i++) {

    vec[i].render();
    vec[i].timer();
    //vec[i].update(); // does what ?
   //vec[i].animate1();
   //vec[i].animate2();
   vec[i].animate3();
  }

}

/////////////////////////// FUNCTIONS ////////////////////////////
public void keyPressed() {
  if (key == 'f') freeze = !freeze;
  if (freeze)
    noLoop();
  else loop();

    if (key == 'e' || key == 'E') {
     beginRecord(PDF, "PDF_Export_###.pdf");
  }

      if (key == 'r' || key == 'R') {
     endRecord();
    println("FINITO!");
  }

}
///////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
  DESIGNING PROGRAMS 1.0
 AN INTRODUCTORY COURSE FOR DESIGN STUDENTS
 
 IMPLEMENTED BY THE FREE ART BUREAU 2013/14 
 >>> www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LETTER FORMS : GEO CLASS
 SKETCH : PV_GEO_CLASS_03
 PARENT SKETCH : PV_GEO_CLASS_02
 TYPE : DYNAMIQUE
 
 **NB
*/

class FontAgent {

  // PVector est une classe propre \u00e0 Processing
  // qui contient des informations pour la position
  // \u00e9ventuellement la v\u00e9locit\u00e9 > vecteur vitesse
  // http://fr.wikipedia.org/wiki/Vitesse#Vecteur-vitesse
  PVector loc;
  PVector vel;
  float offX;
  float xMove;
  float dia;
  float trans;
  //Create a timerMax
  int timer, timerMax;
  //Create a boolean to check our object's life.
  boolean death;

  // Notre constructeur permet d'initialiser notre objet > instance d'une classe
  // http://www.commentcamarche.net/contents/553-java-constructeurs
  FontAgent(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(-0.1f, 0.1f);
    dia = 2.0f;
    //trans = 0;
    timer = 0;
    death = false;
    this.timerMax = 500;
    trans = map(timer, 0, timerMax, 15, 0);

  }

  // M\u00e9thode pour dessiner la forme
  public void render() {
    fill(120, 173, 60, trans);
    noStroke(); 
    ellipse(loc.x, loc.y, dia, dia);
  }

  // M\u00e9thode pour bouger la forme
  // gr\u00e2ce \u00e0 notre vecteur v\u00e9locit\u00e9.
  public void update() {
    //loc.add(vel);
    //trans-=0.5;
    dia -= 0.05f;
  }

  // des m\u00e9thodes pour intervenir sur nos formes
  // et cr\u00e9er des animations diff\u00e9rentes
  public void animate1() {
    offX = frameCount * (loc.x + loc.y);
    loc.x += sin(offX)*0.5f;
  }

  public void animate2() {
    offX = frameCount * (loc.x + loc.y);
    dia+= noise(offX*0.05f) * 0.05f;
    loc.x += noise(offX)*0.5f;
  }

  public void animate3() {
    offX = noise(frameCount+(loc.x*0.001f), frameCount+(loc.y*0.003f)) * 373.05f;
    //dia+= sin(offX*0.003) * 0.5;
    //    dia-=0.05;
    loc.x += cos(offX)*0.5f;
    loc.y += sin(offX)*0.5f;
  }

  public void timer() {
    timer+=0.9f;
    dia = map(timer, 0, timerMax, 1, 0);

    //Map timer to transparency values between 0 & 255 
    trans = map(timer, 0, timerMax, 7, 0);
    if (timer>=timerMax) {
      death = true;
    }
  }


  ////////////////////////////////////////////////
  /*   
   void check() {
   if(loc.x > width) {
   loc.x = 0;
   } 
   if(loc.x < 0) {
   loc.x = width;
   } 
   
   if(loc.y > height) {
   loc.y = 0;
   } 
   if(loc.y < 0) {
   loc.y = height;
   } 
   }
   */
}

  public void settings() {  size(1100, 400);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PV_Geo_Class_03" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
