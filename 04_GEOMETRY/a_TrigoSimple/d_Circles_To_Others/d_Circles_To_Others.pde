/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

float angle;
float radius = 100;
int numSides;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(210);
  smooth();
  fill(0, 0, 255);
  strokeWeight(4);
  stroke(255, 0, 0);

}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  translate(width/2, height/2);
  
  // We use the mouse to change the var numSides
  numSides = (int)map(mouseX, 0, width, 1, 18);
  angle = radians(360/numSides);
  
  // What happens here if we activate this line?
  //radius = map(mouseY, 0, height, 10, 200);
    
  beginShape();
  for (int i = 0; i<numSides; i++) {

    float x = cos(i * angle) * radius;
    float y = sin(i * angle) * radius;
    
    vertex(x, y);
  }
  endShape(CLOSE);
}

/////////////////////////// FUNCTIONS ////////////////////////////

