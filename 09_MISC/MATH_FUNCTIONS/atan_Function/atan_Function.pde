/*
Atan - Calculate angle between 2 points
http://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/
*/

int x, y;

void setup() {
  size(500, 500);
  x = width/2;
  y = height/2;
  textSize(20);
  textAlign(CENTER, CENTER);
  noStroke();
  smooth();
}

void draw() {
  background(255);
  float angle = atan2(mouseY-y, mouseX-x);
  translate(x, y);
  fill(0);
  ellipse(0, 0, 100, 100);
  fill(255);
  text(int(degrees(angle)), 0, 0);
  rotate(angle);
  fill(0, 0, 255);
  ellipse(50, 0, 30, 30);
}

