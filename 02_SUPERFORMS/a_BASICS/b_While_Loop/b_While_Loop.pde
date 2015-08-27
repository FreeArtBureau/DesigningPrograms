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
  noFill();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);

  int y = 10; // Declare & initialise our variable y

  // condition TEST. If TRUE we repeat action between the curly brackets
  while (y<height-10) { 
    
    // Draw black lines
    stroke(0);
    line(0, y, width, y);
    
    
    // Draw red lines
    stroke(255, 0, 0);
    line(0, y+3, width, y+3);
    
    
    // Update our variable
    y+=6;
  }
}


/////////////////////////// FUNCTIONS ////////////////////////////

