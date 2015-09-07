/*
 * COLOUR STRATEGY_01
 * Draws a random square filled with colour from an image
 *
 * Author & date
 * Function taken from J Tarbell 
 * complexification.net
 *
 * http://devmag.org.za/2012/07/29/how-to-choose-colours-procedurally-algorithms/

*/

/////////////////////////// GLOBALS ////////////////////////////
PImage IMG;
int SEED;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(0);
  smooth();
  noStroke();
  rectMode(CENTER);
  IMG = loadImage("readTheSourceLuke.jpg");
  size(IMG.width, IMG.height);
  //image(IMG, 0, 0);
  SEED = 1000;

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  randomSeed(SEED);
  drawRandomBox(50);

}

/////////////////////////// FUNCTIONS ////////////////////////////
void mousePressed() {
  SEED = (int)random(10000);
}

void drawRandomBox(int boxSize) {

 int x = (int)random(IMG.width);
 int y = (int)random(IMG.height);
 color myc =  readBackground(x, y);
 noStroke();
 fill(myc);
 rect(x, y, boxSize, boxSize);
  
}

// Better/more optimised means of getting colour ?
// Using pixel array as opposed to get()
color readBackground(int x, int y) {
  // translate into img image dimensions
  int ax = int(x * (IMG.width*1.0)/width);
  int ay = int(y * (IMG.height*1.0)/height);

  color c = IMG.pixels[ay*IMG.width+ax]; // CHANGE HERE IF YOU WANT TO CREATE GEOMETRIC PATTERNS
  return c;
}
