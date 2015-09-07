import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ORGAN_LETTERS_01 extends PApplet {

/*
PLEASE READ INFO
*/

/////////////////////////// GLOBALS ////////////////////////////


boolean PDFEXPORTING = false;

ControlP5 INTERFACES;
PImage[] glyphs; // images - Nous avons 26 images !

////////////////////////////////////////////// SETUP 

public void setup() {  
  size(700, 600, JAVA2D);
  smooth();
  controlInit(); // on initialise notre interface
  glyphInit(); // on initialise nos glyphes

  ellipseMode(CENTER);
  background(255);
  noiseDetail(2, .5f);
}
////////////////////////////////////////////// DRAW

public void draw() { 
  if (PDFEXPORTING) beginRecord(PDF, "Export_PDF_###.pdf");
  background(255);

  xCount += xSpeed;
  yCount += ySpeed;

  for (int y=0; y <= glyphs[INDEX].height-1; y++) {
    for (int x=0; x <= glyphs[INDEX].width-1; x++) {

      if (x%noiseRes == 0 && y%noiseRes == 0) {
        noiseVal = noise((x - xCount)*noiseScale, (y - yCount)*noiseScale, frameCount*noiseSpeed);

        float g = noiseVal*720.0f;
        theta = (-(g * PI))/180.0f;
        xv = cos(theta) * speed;
        yv = sin(theta) * speed;

        if (lines) {
          //c = somecolour();
          int pix = glyphs[INDEX].get(PApplet.parseInt(x), PApplet.parseInt (y));
          if ((pix >= color(0)) && (pix <= color(30))) {
            strokeWeight(0.3f);
            stroke(0);

            if (NOISE_LENGTH) {
              float lineLen = noiseVal*0.0005f;
              line (x - (xv/lineFX), y - (yv/lineFX), (x-lineLen)*0.9f, (y-lineLen)*0.9f);
            } else {
              //line (x - (xv/5), y - (yv/5), (x-lineLength)*0.9, (y-lineLength)*0.9);
              beginShape();
              vertex(x - (xv/lineFX), y - (yv/lineFX));
              vertex(x, y);
              endShape();
            }
          }
        }
      }
    }
  }
  //noiseCount += noiseSpeed;

  ///////////////////////////////////////////////////////////////////////////////
  // PDF EXPORTING (Appuyer sur la touche 'ALT' pour exporter une image en pdf)
  if (PDFEXPORTING) {
    endRecord();
    println("Exported !");
    PDFEXPORTING = false;
  }

  if (ANIMATE) {
    noiseSpeed = 0.001f;
  } else {
    noiseSpeed = 0;
  }
}

float noiseVal;
float noiseScale = 0.001f;
float noiseCount = 0.0f;
float noiseSpeed = 0.002f;

float xCount, xSpeed;
float yCount, ySpeed;

float theta;
float angle;
float angleDelta;
float xv, yv;
float speed = 125;
float lineFX;
int c;
boolean lines = true;
boolean freeze = false;
boolean NOISE_LENGTH;
boolean ANIMATE;
int noiseRes=6;
int xTotal = PApplet.parseInt(600 / noiseRes);
int yTotal = PApplet.parseInt(600 / noiseRes);  




/////////////////////////////////// On charge nos images par ici
public void glyphInit() {
  glyphs = new PImage[26];

  for (int i=0; i<glyphs.length; i++) {
    glyphs[i] = loadImage("Found/Found_"+nf(i, 3)+".png");
    glyphs[i].resize(600, 600);
  }
  imageMode(CENTER); 
}
///////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 PROJET TYPO 
 CR\u00c9ATION NUM\u00c9RIQUE
 ++++++++++++++++++++++++++++++++++++++++++
 TRAMES : TRAMES
 SKETCH : ORGAN_LETTERS_01
 PARENT SKETCH : 
 TYPE : DYNAMIQUE
 
 SUGGESTIONS :
 
++++++++++++++++++++++++++++++++++++++++++ 
/////////////////////////////////////// END

*/


///////////////////////////////////// INTERFACE
int INDEX = 2;
int ALPHA_NUM = 4;
int CHOIX;
float SHP_SIZE;
int PNTS,PNTS_OFF;
float ANGLE_1;

boolean CIRCLES = false;
boolean FILL_IN = false;
float DIA;

public void controlInit() {

  // Initialiser notre objet (On a toujours besoin de le faire).
  INTERFACES = new ControlP5(this);  


  //////////////////////////////////// Add group for FORME1 ( LINES )
  Group g1 = INTERFACES.addGroup("g1")
    .setPosition(10, 20)
      .setWidth(180)
        .activateEvent(true)
          .setBackgroundColor(color(0xffC9BFBF))
            .setBackgroundHeight(180)
              .setLabel("LINES")
                .setBarHeight(15)
                ;
  ///////////////////////////////////////// g1 Form Settings
  Slider s = INTERFACES.addSlider("noiseRes").setPosition(10, 20).setRange(1, 10).setValue(6).setGroup(g1); 
  Slider s2 = INTERFACES.addSlider("noiseScale").setPosition(10, 35).setRange(0.001f, 0.015f).setValue(0.005f).setGroup(g1);  
  Slider inter = INTERFACES.addSlider("lineFX").setPosition(10, 50).setRange(1, 50).setValue(7).setGroup(g1);  

  Slider r = INTERFACES.addSlider("xSpeed").setPosition(10, 70).setRange(0.0f, 5.0f).setValue(0.0f).setGroup(g1);  
  Slider a = INTERFACES.addSlider("ySpeed").setPosition(10, 85).setRange(0.0f, 5.0f).setValue(0.0f).setGroup(g1);
  Slider yOff = INTERFACES.addSlider("YOFF").setPosition(10, 100).setRange(-5.0f, 5.0f).setValue(0.0f).setGroup(g1);  
  Slider xOff = INTERFACES.addSlider("XOFF").setPosition(10, 115).setRange(-5.0f, 5.0f).setValue(0.0f).setGroup(g1);  




  //////////////////////////////////// Add group for FORME2 ( CIRCLES )
  Group g2 = INTERFACES.addGroup("g2")
    .setPosition(200, 20)
      .setWidth(180)
        .activateEvent(true)
          .setBackgroundColor(color(0xffC9BFBF))
            .setBackgroundHeight(100)
              .setLabel("CIRCLES")
                .setBarHeight(15)
                ;
  ///////////////////////////////////////// g1 Form Settings
  Slider d = INTERFACES.addSlider("DIA").setPosition(10, 20).setRange(0, 100).setValue(10.0f).setGroup(g2);  

  Toggle addCircle = INTERFACES.addToggle("CIRCLES").setPosition(10, 35).setSize(10, 10).setValue(false).setLabel("Circles On/Off").setGroup(g2); 
  Toggle addFill = INTERFACES.addToggle("FILL_IN").setPosition(100, 50).setSize(10, 10).setValue(false).setLabel("FILL On/Off").setGroup(g2);
  Toggle addNoiseLen = INTERFACES.addToggle("NOISE_LENGTH").setPosition(10, 65).setSize(10, 10).setValue(false).setLabel("NLENGTH On/Off").setGroup(g2);

  Toggle anime = INTERFACES.addToggle("ANIMATE").setPosition(100, 65).setSize(10, 10).setValue(false).setLabel("ANIME On/Off").setGroup(g2);

  ///////////////////////////////////////// DROPDOWN LIST [FONTS]

  ListBox d1 = INTERFACES.addListBox("glyphs").setPosition(450, 20).setSize(100, 200);


  // RAJOUTER NOS \u00c9L\u00c9MENTS (FONTES) \u00c0 NOS LISTES
  for (int i=0; i<ALPHA_NUM; i++) { // variable numFontes d\u00e9t\u00e9rmine le nombre d'\u00e9l\u00e9ments dans la liste
    ListBoxItem lbi = d1.addItem("glyphs "+i, i); // Ajouter premi\u00e8re liste
    d1.setColorBackground(0xffff0000);
  }
}


////////////////////////////////// SAVING PATCHES
public void keyPressed() {
  // default properties load/save key combinations are 
  // alt+shift+l to load properties
  // alt+shift+s to save properties
  if (key=='1') {
    INTERFACES.saveProperties(("hello.properties"));
  } else if (key=='2') {
    INTERFACES.loadProperties(("hello.properties"));
  }


  if (keyCode == ALT) {
    PDFEXPORTING = true;
  }

  if ((keyCode != ALT) && (keyCode != CONTROL) && (key != CODED)) {
    // convert key to int and attribute to INDEX
    INDEX = PApplet.parseInt(key)-97;
  }
 }



/////////////////////////////////////////////////////////////////////// EVENTS

public void controlEvent(ControlEvent theEvent) {

  if (theEvent.isGroup()) {
    println(theEvent.group().value()+" from "+theEvent.group());
  }

  //****************************************************
  // V\u00c9RIFIER SI ON RE\u00c7OIT UN \u00c9V\u00c9NEMENT TYPE MOUSEPRESSED SUR LA LISTE
  // & CHARGER LA FONTE EN FONCTION
  
  if (theEvent.isGroup() && theEvent.name().equals("glyphs")) {

    // Variable pour changer de fonte 'choix'
    CHOIX = (int)theEvent.group().value();
    println("test "+CHOIX);

    if (CHOIX == 0) {
      for (int i=0; i<glyphs.length; i++) {
        glyphs[i] = loadImage("Found/Found_"+nf(i, 3)+".png");
        glyphs[i].resize(600, 600);
      }
    } else if (CHOIX == 1) {
      for (int i=0; i<glyphs.length; i++) {
        glyphs[i] = loadImage("Caslon/Caslon_"+nf(i, 3)+".png");
        glyphs[i].resize(600, 600);
      }
    } else if (CHOIX == 2) {
      for (int i=0; i<glyphs.length; i++) {
        glyphs[i] = loadImage("Caviar/Caviar_"+nf(i, 3)+".png");
        glyphs[i].resize(600, 600);
      }
    } else if (CHOIX == 3) {
      for (int i=0; i<glyphs.length; i++) {
        glyphs[i] = loadImage("Harabara/Harabara_"+nf(i, 3)+".png");
        glyphs[i].resize(600, 600);
      }
    }
  }
  
}



  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#030303", "--hide-stop", "ORGAN_LETTERS_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
