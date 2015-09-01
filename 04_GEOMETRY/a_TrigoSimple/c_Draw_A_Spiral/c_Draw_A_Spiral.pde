/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

float theta;
float radius = 0; // Start at 0.
int numTurns = 15; // number of turns
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth(8);
  noStroke();
  fill(0, 0, 255); 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  translate(width/2, height/2);
  // We create a loop for the variable deg (degrees)
  // Multiply by a factor to have more turns
  for (int deg=0; deg<360*numTurns; deg++) {    
    theta = radians(deg); //Convert theta so we can use degrees.

    float x = cos(theta) * radius;
    float y = sin(theta) * radius;

    ellipse(x, y, 1, 1);
    radius+=0.09; //Increment our radius at each iteration of our loop.
  }
  noLoop();
}

/////////////////////////// FUNCTIONS ////////////////////////////

