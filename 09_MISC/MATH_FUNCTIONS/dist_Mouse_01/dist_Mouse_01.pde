/*

 */

/////////////////////////// GLOBALS ////////////////////////////

float maxDist;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  fill(0, 0, 255);
  maxDist = dist(0, 0, width, height);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  for (int y=0; y<=height; y += 20) {
    for (int x=0; x<=width; x += 20) {
    float mouseDist = dist(mouseX, mouseY, x, y);
    float dia = (mouseDist / maxDist) * 50;
    ellipse(x, y, dia, dia);
    
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

