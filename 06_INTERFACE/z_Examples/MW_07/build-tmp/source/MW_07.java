import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class MW_07 extends PApplet {



/*
Modification of Alexandre Rivaux's ForEver Loop sketches
 ::::::::::::::::::::::
 DNA STRANDS_007
 ::::::::::::::::::::::
 
 Added :
 - Interface Noise & Manual rotation of lines
 
 Note to self :
 To gain insight into a system, one needs to spend 
 time exploring it. There is no other way.
 */


//Sketch properties
int pWidth = 1280;
int pHeight = 720;

// geometry
float WAVE_AMP;
float WAVE_FREQ;
float YOFF_SET,XOFF_SET;
float ROTATE_MAN;
boolean PERLIN_ROTATE;
float NOISE_SCALE, NOISE_AMM;
float theta;
float thetaOffSet;
int marginTop, marginBottom, marginLeft, marginRight;

// graphics
float LINE_LEN, LINE_THICK;
boolean ALPHA;
// interface
ControlP5 INTERFACE;

public void setup() {
  size(pWidth, pHeight, P3D);
  smooth(8);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100, 100);
  //interface is now a function. See INTERFACE TAB
  initInterface();         
        
  // geometry
  marginTop = marginBottom = 200;
  marginLeft = marginRight = 50;
  theta = 0.0f;
  thetaOffSet = 0.05f;
}

public void draw() {
  background(40);
  //INTERFACE.draw();
  // Important - update theta first here
  theta += thetaOffSet;
  // Interesting why we create a new variable. What is happening here?
  float phi = theta;
    
  for (int j=marginTop; j<height-marginBottom; j+=YOFF_SET) {
    float dphi = (TWO_PI/ (height-(marginTop+marginBottom)))*YOFF_SET;// 24.7 - other values here    
    for (int i=marginLeft; i<width-marginRight; i+=XOFF_SET) {
      float x = i;  
      float y = j+sin(phi*WAVE_FREQ)*WAVE_AMP;

      float dist = dist(x, y, width/2, height/2);
      float hue = map(dist, 0, height/2, 200, 230);
      if(ALPHA) {
        float alpha = map(sin(phi)*WAVE_AMP, 0, WAVE_AMP, 0, 100);
         stroke(hue, 100, 100, alpha);

      } else {
         stroke(hue, 100, 100);
      }
      noFill();
      strokeWeight( LINE_THICK );
      pushMatrix();
      translate(x, y);
      
      // ROTATIONS
      if(PERLIN_ROTATE) {
        float snx = sin(frameCount * 0.0007f) * 6; // Smoother
        float sny = sin(frameCount * 0.0003f) * 6; // Smoother

        float pr = noise(x * NOISE_SCALE + snx, y * NOISE_SCALE + sny) * NOISE_AMM;
        rotate(radians(pr));
      } 
      else {       
      rotate(radians(ROTATE_MAN));
      }
      
      line(-LINE_LEN, -LINE_LEN, LINE_LEN, LINE_LEN);
      
      //rect(0, 0, 25, 25);

      popMatrix();
      // NOTE : now added within both loops
      phi += dphi;
    }
  }
}

/*
  ::::::::::::::::::
  
  ::::::::::::::::::
  
  
  I think this could turn out to be an interesting motion piece.
  It could be used by the students to explore patterns in movement.
  I could present a little motion > Lye / Normal / Richter / Bass ...
  yet go on to explain the differences between these and computational practices
  
  It is also a coherent piece to go on from earlier pattern work
  which was for the most part an interactive system. This is an autonomous
  one and it is an important step too. Because from here I can go on to explain
  that autonomous systems can be driven by data. Data becomes the food for modifying
  the visuals. 







*/
/*
CONTROLP5 Interface (GUI)

*/
public void initInterface() {
  INTERFACE = new ControlP5(this);
  
  Slider s1 = INTERFACE.addSlider("WAVE_AMP")
    .setPosition(10, 10)
      .setRange(0, 73)
        .setValue(15);
  Slider s2 = INTERFACE.addSlider("WAVE_FREQ")
    .setPosition(10, 20)
      .setRange(0.05f, 0.9f)
        .setValue(0.5f); 
  Slider s3 = INTERFACE.addSlider("LINE_LEN")
    .setPosition(10, 40)
      .setRange(1, 200)
        .setValue(15);
  Slider s4 = INTERFACE.addSlider("LINE_THICK")
    .setPosition(10, 50)
      .setRange(0.1f, 30.0f)
        .setValue(1.0f);

  Slider s5 = INTERFACE.addSlider("YOFF_SET")
    .setPosition(10, 60)
      .setRange(1, 60)
        .setValue(15);

  Slider s6 = INTERFACE.addSlider("XOFF_SET")
    .setPosition(10, 70)
      .setRange(1, 60)
        .setValue(15);
        
  Slider s7 = INTERFACE.addSlider("ROTATE_MAN") 
    .setPosition(10,80)
      .setRange(0, 360)
        .setValue(0);
        
  Toggle t1 = INTERFACE.addToggle("ALPHA")
    .setPosition(180,10)
      .setSize(10,10)
        .setValue(false);
  
  Toggle t2 = INTERFACE.addToggle("PERLIN_ROTATE")
    .setPosition(320,10)
      .setSize(10,10)
        .setValue(false); 
       
  Slider s8 = INTERFACE.addSlider("NOISE_SCALE")
    .setPosition(320,40)
     .setRange(0.1f, 0.001f)
        .setValue(0.004f); 
 
 Slider s9 = INTERFACE.addSlider("NOISE_AMM")
    .setPosition(320,50)
     .setRange(1,600)
        .setValue(300);        
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#030303", "--hide-stop", "MW_07" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
