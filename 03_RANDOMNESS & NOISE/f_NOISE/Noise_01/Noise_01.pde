/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/


/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 200);
  background(0);
  noStroke();
  smooth();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  
  // Notice that the value returned is always the same.
  // Noise returns values between 0 & 1 regardless of the value added in brackets
  //Unlike random which generates values within a range of possibilities (Uniform Distribution).
  float n = noise(1); 
  print(n);
  ellipse(n*width,100,50,50);

}

/////////////////////////// FUNCTIONS ////////////////////////////

