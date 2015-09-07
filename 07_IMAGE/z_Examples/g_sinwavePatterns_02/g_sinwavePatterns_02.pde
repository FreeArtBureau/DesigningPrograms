/*

 */

/////////////////////////// GLOBALS ////////////////////////////
PImage img;
import controlP5.*;
ControlP5 INTERFACES;

int DOTSIZE;
float FREQ, FREQFACT, AMP, NOISESCALE, NOISEVALUE, PAS;
/////////////////////////// SETUP ////////////////////////////

void setup() {

  background(0);
  smooth();
  noStroke();
  ControlInit();
  FREQ = 0.5;
  img = loadImage("japaneselady.jpg");
  size(img.width, img.height, JAVA2D);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  randomSeed(10000);
  
  for (int x= 0; x<img.width; x+=PAS) {
    for (int y= 0; y<img.height; y+=PAS) {

      color c = img.get((int)x, (int)y);
      color f = int(brightness(c));

      if (f >=110) {
        fill(c);
        y += sin(FREQ * FREQFACT) * AMP;
        FREQ = noise(x*0.05, y*0.05) * NOISEVALUE ;
        ellipse(x, y, DOTSIZE, DOTSIZE);
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's')saveFrame("capture_###.png");
}

