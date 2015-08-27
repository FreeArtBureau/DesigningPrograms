/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/


/////////////////////////// GLOBALS ////////////////////////////

float x, y;
float noiseScale = 0.07; // Increase the scale of noise - more erratic
float noiseAmm = 33.0; // Increase the amount of noise - bigger movements

/////////////////////////// SETUP ///////////////////////////  /

void setup() {
  size(300, 200);
  background(0);
  smooth();
  y = 0;
  x = 0;
  noiseDetail(3, 0.7); //Harmonic distribution and a factor
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  stroke(255);
  // We use noise function with the x variable to calculate
  // values in line with our object's position.
  float nz = noise(x*noiseScale) * noiseAmm;
  //println(nz);  
  point(x, y+nz);
  
  x++;
  if (x>=width) {
    x = 0;
    y += 5;
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

