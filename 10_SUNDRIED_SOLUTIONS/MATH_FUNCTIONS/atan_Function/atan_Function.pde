/*
 * The Arcangent Function
 * Handy for calculating angles bewtween 2 points
 *
 * MW 3.11.15
 *
 * end
 
 */

///////////////////// GLOBALS ////////////////////

int x, y;
///////////////////// SETUP ////////////////////

void setup() {
  size(400, 400);
  x = width/2;
  y = height/2;
  textSize(20);
  textAlign(CENTER, CENTER);
  noStroke();
  smooth();
}

///////////////////// DRAW ////////////////////
void draw() {
  background(150);
  translate(x, y);
  fill(0);
  ellipse(0, 0, 80, 80);
  fill(255);
  
  float angle = atan2(mouseY-y, mouseX-x);
  text(int(degrees(angle))+"°", 0, 0);
  rotate(angle);
  fill(0, 0, 255);
  ellipse(100, 0, 50, 50);
}

