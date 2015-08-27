/*
NOISE PIXELS
 NB. REMEMBER THAT NOISE RETURNS A VALUE BETWEEN 0,1
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
  size(450, 300, P3D);
  background(0);
  smooth();
  noiseDetail(1); //Try different noiseDetails for diff effects.
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  stroke(255);
  for (int x=50; x<width-50; x+=5) {
    for (int y=50; y<height-50; y+=5) {
      //Here we've added a third argument to our noise to change
      //the pixel values every framecount
      //Play with different values for x,y,z and the mapped value of 200
      float z = map(noise(x*0.05, y*0.01, 0.001*frameCount), 0, 1, 0, 200);
      point(x, y, z);
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

