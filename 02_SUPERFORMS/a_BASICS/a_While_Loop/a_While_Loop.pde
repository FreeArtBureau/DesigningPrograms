/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
*/

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 200);
  background(255);
  smooth();
  noStroke();
  fill(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  
  int x = 20; // Declare & initialise our variable x
  
  // condition TEST. If TRUE we repeat action between the curly brackets
  while (x<width) { 
    
    // Draw a rectangle
    ellipse(x, 100, 25, 25);
    
    // Update our variable
    x+=50;
  }
}


/////////////////////////// FUNCTIONS ////////////////////////////

