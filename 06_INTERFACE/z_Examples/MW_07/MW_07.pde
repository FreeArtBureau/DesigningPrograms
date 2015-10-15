/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

PrintWriter output; // Used to write data to file

import controlP5.*;
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

void setup() {
  size(pWidth, pHeight, P3D);
  smooth(8);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100, 100);
  //interface is now a function. See INTERFACE TAB
  initInterface();         
        
  // geometry
  marginTop = marginBottom = 200;
  marginLeft = marginRight = 50;
  theta = 0.0;
  thetaOffSet = 0.05;
}

void draw() {
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
        float snx = sin(frameCount * 0.0007) * 6; // Smoother
        float sny = sin(frameCount * 0.0003) * 6; // Smoother

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

void keyPressed() {
 if(key=='s')saveFrame("ScreenGrab_###.png"); 
  
}

