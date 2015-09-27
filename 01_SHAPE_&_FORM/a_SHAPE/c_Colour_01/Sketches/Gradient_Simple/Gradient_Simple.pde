/*
DRAWS A BACKGROUND COLOUR GRADIENT USING
 THE lerpColor() FUNCTION.
 */

/////////////////////////// GLOBALS ////////////////////////////
//DECLARE TWO COLOUR VARIABLES
color b1, b2;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  //background(0);
  smooth();
  noFill();
  b1 = color(255,0, 0); //ASSIGN BLACK TO b1
  b2 = color(0, 0, 255); //ASSIGN WHITE TO b2
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  for (int i=0; i<height; i++) {
    //MAP HEIGHT INCREMENT TO VALUES BETWEEN 0 & 1
    float inter = map(i, 0, height, 0, 1);
    
    //LINEAR INTERPOLATE FROM b1 TO b2 AT INCREMENT DETERMINED BY VAR inter.
    color c = lerpColor(b1, b2, inter);
    //stroke(c);
    noStroke();
    //line(0, i, width, i);
    fill(c);
    rect(i, 200, 50, 50);
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

