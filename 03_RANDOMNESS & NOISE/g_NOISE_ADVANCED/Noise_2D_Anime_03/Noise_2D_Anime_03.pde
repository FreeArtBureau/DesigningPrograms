/*
NOISE PIXELS
NB. REMEMBER THAT NOISE RETURNS A VALUE BETWEEN 0 & 1
SO WE CAN NOT SIMPLY ADD THE X & Y VALUES TO NOISE
SO WE CREATE XOFF & YOFF VARIABLES AND INCREMENT BY 
SMALL VALUE. 

ANOTHER SOLUTION TO THIS IS TO MULTYPLY X & Y
BY A SMALL FLOAT, SAY 0,004
CODE BY D.SHIFFMAN
 */

/////////////////////////// GLOBALS ////////////////////////////

//////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400, P3D);
  background(0);
  smooth();
  noiseDetail(1, 0.5); //Try different noiseDetails for diff effects.

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
    background(0);
    stroke(255);
  for (int x=0; x<width; x+=3) {
    for (int y=0; y<height; y+=3) {
      //Here we've added a third argument to our noise to change
      //the pixel values every framecount
      float z = map(noise(x*0.04, y*0.04, 0.01*frameCount), 0, 1, 0, 255);
      point(x,y,z);
}
  }

}

/////////////////////////// FUNCTIONS ////////////////////////////

