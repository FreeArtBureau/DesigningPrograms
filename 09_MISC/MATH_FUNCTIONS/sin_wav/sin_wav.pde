/*
SIMPLE SIN WAVE
COULD BE USED WITH RANDOM & NOISE TO EXPLAIN THE VARIOUS
VALUES RETURNED WITH THESE FUNCTIONS. 
NOISE : 0 TO 1
SIN : -1 TO 1
*/

/////////////////////////// GLOBALS ////////////////////////////

int sinAmp = 50;
int sinFreq = 30;
/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(400, 400);
  background(0);
  smooth();
  stroke(255);

  for(float x=0; x<width; x+=1) { //Must be a float 
    point(x,200 + sinAmp * sin(x/sinFreq)); 
  }

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  
}

/////////////////////////// FUNCTIONS ////////////////////////////

