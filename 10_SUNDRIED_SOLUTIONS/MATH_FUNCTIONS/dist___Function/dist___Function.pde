/*
 * Distance
 *  Calculates the distance between two points. 
 * MW 3.11.15
 *
 * end 
 */

///////////////////// GLOBALS ////////////////////
float x, y;
float x2, y2;
PFont a;

///////////////////// SETUP ////////////////////
void setup() {
  size(400, 400);
  background(150);
  smooth();
  a = createFont("Helvetica", 24);
  textFont(a);
  cursor(CROSS);
  x = width/2;
  y = height/2;
}


///////////////////// DRAW ////////////////////
void draw() {
  background(150);
  x2 = mouseX;
  y2 = mouseY;
  float result = dist(x, y, x2, y2);
  
  stroke(255, 0, 0);  
  line(x, y, x2, y2);

  noStroke();
  fill(0, 0, 255);
  ellipse(x, y, 25, 25);

  text(result, mouseX, mouseY+20);
}

