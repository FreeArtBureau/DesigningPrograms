/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img;
float thresh;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600);
  background(255);
  smooth();
  noStroke();
  img = loadImage("japaneselady.jpg");
  thresh = 0.0;
 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
   background(255);
   image(img,0,0,800, 600);
   // apply a threshold filter with level set at 0.3 (min = 0, max = 1)
   // this means pixels with a gray value greater than 30%
   // of maximum brightness will be set to white.
   filter(THRESHOLD, thresh);
   
   thresh = thresh+0.001;
   // control thresh variable
   if(thresh >= 1) 
   thresh = 0.0;
   println(thresh);
   
   
   // Some other filters to check
   //filter(BLUR, 4); // Adds levels of blur
   //filter(GRAY); // sets to Black & White
   //filter(DILATE); // Increases light areas
}

/////////////////////////// FUNCTIONS ////////////////////////////

