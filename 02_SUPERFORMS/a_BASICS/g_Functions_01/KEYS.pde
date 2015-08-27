/*

NOTE : We can add new TABS and organise our code in a more readable manner
*/


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
  
  // Increase line thickness
  if (key == 'w') {
    thickness += 0.5;
  }
  
   // Decrease line thickness
  if (key == 'x') {
    thickness -= 0.5;
  }
  
   // Increase line length
  if (key == 'a') {
    lineLength += 0.5;
  }
  
   // Decrease line length
  if (key == 'z') {
    lineLength -= 0.5;
  }
}

