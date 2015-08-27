/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////

int circleDiameter;
int xInterval, yInterval;
float thickness;
int seed;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(650, 450);
  background(255);
  smooth();
  noFill();
  circleDiameter = 50;
  xInterval = 75;
  yInterval = 75;
  thickness = 0.5;
  seed = (int)random(10000);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  randomSeed(seed);


  for (int y = 75; y < height-50; y += yInterval) {       
    for (int x = 75; x < width-50; x += xInterval) {        
      strokeWeight( thickness );
      // generate a random number between 0 & 6
      int dice = (int)random(0,7);
      
      if(dice<=3) {
      stroke(0);
      ellipse( x, y, circleDiameter, circleDiameter);
      }
      else {
      stroke(150);
      
      // What happens if we disactivate this line (make it a comment with // )
      ellipse( x, y, circleDiameter, circleDiameter);
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
// SOME KEY INTERACTIONS THAT ENABLE US TO CHANGE OUR VARIABLES
// AND THEREFORE CHANGE OUR VISUAL IN REAL TIME

void keyPressed() {
  
  if(key == 'r') {
   seed = (int)random(10000);
  }
  
  // Increase the size of our cirlces
  if (key == '+') {
    circleDiameter += 2;
  }
  
  // Decrease the size of our cirlces
  if (key == '-') {
    circleDiameter -= 2;
  }

  // Increase the y interval of our grid
  if (keyCode == UP) {
    yInterval += 2;
  }

  // Decrease the y interval of our grid
  if (keyCode == DOWN) {
    yInterval -= 2;
  }

  // Increase the x interval of our grid
  if (keyCode == RIGHT) {
    xInterval += 2;
  }
  
   // Decrease the x interval of our grid
  if (keyCode == LEFT) {
    xInterval -= 2;
  }
  
  // Increase the x interval of our grid
  if (key == 'w') {
    thickness += 0.5;
  }
  
   // Decrease the x interval of our grid
  if (key == 'x') {
    thickness -= 0.5;
  }
}

