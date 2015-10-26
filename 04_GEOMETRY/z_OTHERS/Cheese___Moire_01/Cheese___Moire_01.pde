/**
 * Cheese & Moiré
 * A functional function for making graphic cheeses ;–) 
 * 
 * MW 23.10.2015
 *
 * REF : 
 *
 */

/////////////////////////// GLOBALS ////////////////////////////

/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(255);
  size(500, 500);
  smooth();
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(255);
  fill(0, 0, 255, 150);

  // @params: x & y postions, number of cheese slices, diameter size
  cheese(150, 150, 25, 100);
  cheese(300, 300, 50, 150);

  cheese(mouseX, mouseY, 73, 200);
}

/////////////////////////// FUNCTIONS ////////////////////////////

// @params: x & y postions, number of cheese slices, diameter size
void cheese(float _x, float _y, int _numSlices, float _dia) {

  noStroke();
  float cheeseSlices = TWO_PI/_numSlices; 
  float yAnime = map(sin(frameCount*0.1), -1, 1, 0, 0);

  for (int i=0; i<_numSlices; i++) {
    pushMatrix();
    translate(_x, _y);  
    //rotate(frameCount*0.01);
    rotate(i*cheeseSlices);
    arc(0, yAnime, _dia/2, _dia, (PI*2.5)-(cheeseSlices/2), (PI*2.5)+(cheeseSlices/2));
    popMatrix();
  }
}

