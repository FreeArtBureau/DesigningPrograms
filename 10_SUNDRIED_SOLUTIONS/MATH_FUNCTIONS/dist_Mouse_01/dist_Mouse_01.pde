/*
 * Distance
 * Can be used to create effects
 
 * MW 3.11.15
 *
 * end 
 */

/////////////////////////// GLOBALS ////////////////////////////

float MAXDIST;
float SPOT_SIZE = 40;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke();
  fill(0, 0, 255);
  MAXDIST = dist(0, 0, width, height);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  for (int y=0; y<=height; y += 20) {
    for (int x=0; x<=width; x += 20) {
      
      float mouseDist = dist(mouseX, mouseY, x, y);
      float dia = (mouseDist / MAXDIST) * SPOT_SIZE;
      ellipse(x, y, dia, dia);
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

