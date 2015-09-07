/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600);
  background(255);
  smooth();
  noStroke();
  img = loadImage("japaneselady.jpg");

 
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
   background(255);
   image(img,0,0,800, 600);
   // apply a threshold filter with level set at 0.3
   // this means pixels with a gray value greater than 30%
   // of maximum brightness will be set to white.
   filter(THRESHOLD, 0.37);
   
   
   // Some other filters to check
   //filter(BLUR, 10); // Adds levels of blur
   //filter(GRAY); // sets to Black & White
   //filter(DILATE); // Increases light areas
}

/////////////////////////// FUNCTIONS ////////////////////////////

