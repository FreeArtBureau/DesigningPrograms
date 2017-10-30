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

public class e_TypoGeo_Draw_05 extends PApplet {

/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////


RFont font;
RPoint[] pnts;
String myText = "VECTOR";
int index;
int step = 7;
float diaFreq = 0.55f;
float diaMax = 5;

FontAgent[] vec;
boolean stopAnime = false;

/////////////////////////// SETUP ////////////////////////////
public void setup() {
  
  background(0);
  
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
public void draw() {

  translate(width/2, height/1.4f);

  if (index<pnts.length-1) {

    float dia = sin(frameCount * diaFreq) * diaMax;
    vec[index].render(dia);
    index+=step;
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
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
 LETTER FORMS : GEO BASICS
 SKETCH : TYPEGEO_DRAW_05
 PARENT SKETCH : TYPEGEO_DRAW_01
 TYPE : AUTONOMOUS
 
 **NB

 */

class FontAgent {

  // PVector est une classe propre \u00e0 Processing
  // qui contient des informations pour la position
  // \u00e9ventuellement la v\u00e9locit\u00e9 > vecteur vitesse
  // http://fr.wikipedia.org/wiki/Vitesse#Vecteur-vitesse
  PVector loc;
  PVector vel;
  int dia;

  // Notre constructeur permet d'initialiser notre objet > instance d'une classe
  // http://www.commentcamarche.net/contents/553-java-constructeurs
  FontAgent(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(0.0f, 0.0f);
    dia = 10;
  }

  // M\u00e9thode pour dessiner la forme
  public void render(float d) {
    fill(255,0,255, 173);
    noStroke(); 
    ellipse(loc.x, loc.y, dia+d, dia+d);
  }

  // M\u00e9thode pour bouger la forme
  // gr\u00e2ce \u00e0 notre vecteur v\u00e9locit\u00e9.
  public void update() {
    loc.add(vel);
  }
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

  public void settings() {  size(960, 400);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "e_TypoGeo_Draw_05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
