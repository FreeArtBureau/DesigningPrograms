/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage img;
PImage img2;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600);
  background(255);
  smooth();
  noStroke();
  img = loadImage("scape_01.jpg");
  img2 = loadImage("abstract.jpg");

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
   background(255);
   image(img,0,0,800, 600);
   
   /* BLEND 1. Blending the same image
   //blend( x, y, width, height, dx, dy, dwidth, dheight, mode);*/
   blend(150, 150, 200, 200, 400, 200, 200, 200, EXCLUSION);
   
   // try this line of code
   //blend(mouseX, mouseY, 200, 200, mouseX, mouseY, 200, 200, EXCLUSION);

   
   /* BLEND 2. Blending another image (the sourceImage) with the screen image
   blend(sourceImage, x, y, width, height, dx, dy, dwidth, dheight, mode);*/
   //blend(img2, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
  
  // Filters can be added
    // filter(THRESHOLD, 0.5);
    //filter(BLUR, 4); // Adds levels of blur
    //filter(GRAY); // sets to Black & White
    //filter(DILATE); // Increases light areas
}

/////////////////////////// FUNCTIONS ////////////////////////////

