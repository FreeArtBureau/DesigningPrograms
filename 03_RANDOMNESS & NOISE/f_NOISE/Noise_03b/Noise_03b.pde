/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////

float x, y;
float noiseScale = 0.07; // Increase the scale of noise - more erratic
float noiseAmm = 90.0; // Increase the amount of noise - bigger movements

/////////////////////////// SETUP ///////////////////////////  /

void setup() {
  size(300, 200);
  colorMode(HSB, 360, 100, 100); 
  background(0);
  smooth();
  y = 10;
  x = 0;
  noiseDetail(1, 0.7); //Harmonic distribution and a factor
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  
  // We use noise function with an object's x variable
  // to calculate values in the line with our object's colour
   color c = color(noise(x*noiseScale)*360, 100, 100);
   stroke(c);
  // We use noise function with the x variable to calculate
  // values in line with our object's position.
  float nz = noise(x*noiseScale) * noiseAmm;
//  println(nz);  
  point(x, y+nz);
  x++; // x variable increases. So, noise values change too.
  
  // Conditional statement : resets x to 0 and steps down by 5 pixels
  if (x>=width) {
    x = 0;
    y += 5;
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

