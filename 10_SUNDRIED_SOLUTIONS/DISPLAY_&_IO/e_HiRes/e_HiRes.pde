/*
 * HiResScreenCapture
 * Saves a hires bitmap image
 *
 * MW 8.10.15
 * http://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(500, 500);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(255);
  smooth();
  strokeWeight(10);
  fill(255, 0, 0);
  ellipse(width/2, height/2, 200, 200);
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's') {
    save("normal.png");
    saveHiRes(3); // UTILISER UN CHIFFRE DE 2 - 4 POUR DES IMAGES COMPLEXES SINON ÇA MOULINE ;–)
    exit();
  }
}

void saveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires.png");
}

