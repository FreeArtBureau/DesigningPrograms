//Building Blocks 2011
//Processing Functions
/*
 sin
 Calculates values between -1 & 1.
 Often used as in this example to make smooth motion. 
 sin();
 */

///////////////////// GLOBALS ////////////////////
float Angle = 0;
///////////////////// SETUP ////////////////////
void setup() {
  size(400, 250);
  noStroke();
  fill(255, 255, 0);
  smooth();
}


///////////////////// DRAW ////////////////////
void draw() {
  background(150);
  for (int i=0; i<4; i++) {
   float offs = frameCount * 0.04;
    float radius = sin(offs) * 25 + 63; //First val (25) changes range of diff. 63 determines the starting size.
    ellipse(50+(100*i), 120, radius, radius);
  }
}

