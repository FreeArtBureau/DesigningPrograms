/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/


/////////////////////////// GLOBALS ////////////////////////////

float noiseY = 0; // We've created a variable that will increment.
int x = 0;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 200);
  background(0);
  smooth();
  noStroke();
  fill(255);
  //This function calculates noise over a range of 'octaves'
  //The number of 'octaves' changes how noise behaves
  //Smaller values give less change & vice-versa.
  noiseDetail(3); 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  float n = noise(noiseY); //Our variable is attributed to our noise function.
  print(n);
  ellipse(x, n*height, 1, 1); //We multiply by height because noise returns always a value between 0 & 1.
  
  // Update our noiseY variable. This has a direct effect  on the smoothness of noise
  // Bigger changes give greater random values
  noiseY+=0.001; //(Anything between 0.03 >>> 0.0001
  
  x++; // move along
  if(x>=width) x = 0;
}

/////////////////////////// FUNCTIONS ////////////////////////////

