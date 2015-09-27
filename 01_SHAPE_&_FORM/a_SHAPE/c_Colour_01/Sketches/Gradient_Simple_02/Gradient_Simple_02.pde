/*
DRAWS A COLOUR GRADIENT IN HSB COLOUR MODE
 */

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 300);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();
  rectMode(CENTER);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  for (int x=0; x<width; x+=1 ) {
    // MAP WIDTH TO HUE VALUES 0 TO 360
    float inter = map(x, 0, width, 0, 360);
    fill(inter, 100, 100);
    rect(x, 150, 10, 200);
  }
}

