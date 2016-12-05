//Building Blocks 2011
//Processing Functions
/*
Ceiling
Rounds up to the nearest integer.
ceil( );
 */

///////////////////// GLOBALS ////////////////////
float x = 3.00089;
float y;

///////////////////// SETUP ////////////////////
void setup() {
  size(300, 200);
  background(150);
  smooth();
  float x2 = ceil(x);
  println("The Ceil value of x = "+ x2);
}


///////////////////// DRAW ////////////////////
void draw() {
}

