/*
 * The Arcangent Function
 * Handy for calculating angles and pointing things to others
 *
 * MW 3.11.15
 *
 * end
 
 */

///////////////////// GLOBALS ////////////////////

///////////////////// SETUP ////////////////////
void setup() {
  size(200, 200);
  background(255);
  smooth();
}

///////////////////// DRAW ////////////////////

void draw() {
  background(255);
  translate(width/2, height/2);
  float a = atan2(mouseY-height/2, mouseX-width/2);
  rotate(a);


  //Draw Arrow
  line(-12, 12, 12, 12);
  //line(12, 12, 12-10, 12-10);
  line(10,-12,12,12);
}

