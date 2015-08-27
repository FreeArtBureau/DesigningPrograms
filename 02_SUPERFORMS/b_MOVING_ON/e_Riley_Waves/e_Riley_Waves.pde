/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
import ddf.minim.*;
int PAS = 45;
float FACTSIN = 22;
float FACTCOS = 22;
boolean ACTIVATEANIME = false;

Minim minim;
AudioPlayer sound;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 460);
  background(255);
  noCursor();
  smooth();
  noFill();

  minim = new Minim(this);
  sound = minim.loadFile("07 Track 07.mp3");
  sound.play();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0);
  fill(0,23);
  rect(-50,-50,width+100, height+100);
  
  if(!ACTIVATEANIME) {
  float interactionSin = map(mouseX, 0, width,0.01, 0.1);
  float interactionCos = map(mouseY, 0, height,0.01, 0.1);
  Riley1(interactionSin);
  Riley2(interactionSin, interactionCos);
  }
  else {
  float interactionSin = sin(frameCount*0.001)*FACTSIN/5;
  float interactionCos = cos(frameCount*0.001)*FACTCOS/5;
  Riley1(interactionSin);
  Riley2(interactionSin, interactionCos);
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////


void Riley1(float sinesFact) {

  for (int y=100; y<height-100; y+=PAS) {
    for (int x=100; x<width-100; x+=PAS) {
      float sines = sin(x*sinesFact) * FACTSIN;
      //float cosines = cos(x*0.05) * 15;
      stroke(255,0,0);
      point(x, y+sines);
      //point(x+cosines,y+sines);
    }
  }
}

void Riley2(float sinesFact, float cosinesFact) {
  float inMix = sound.mix.get(0) * 10;
  float snx = sin(frameCount * 0.0073) * inMix;
  float sny = sin(frameCount * 0.0071) * inMix;
  
  for (int y=100; y<height-100; y+=PAS*2) {
    for (int x=100; x<width-100; x+=PAS) {
      float sines = sin(x*sinesFact) * FACTSIN;
      float cosines = cos(x*cosinesFact) * FACTCOS;
       float sw = noise(x*0.01+snx, y*0.01+sny, frameCount*0.05) * (5*inMix);
       strokeWeight(abs(sw));
      stroke(0,0,255);
      //point(x,y+sines);
      point(x+cosines, y+sines);
    }
  }
}

void keyPressed() {
 if(key == '+') {
  FACTSIN++;
  FACTCOS++;
  //println(FACTSIN);
  //println(FACTCOS);
 } 
 
  if(key == '-') {
  FACTSIN--;
  FACTCOS--;
 } 
 
   if(key == 'p') {
  PAS++;
 }
 
    if(key == 'l') {
  PAS--;
 }
 
 if(key == 'a' || key == 'A') {
   ACTIVATEANIME = !ACTIVATEANIME;
 }
  
}

