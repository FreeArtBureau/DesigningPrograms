/*

NOTE : We can add new TABS and organise our code in a more readable manner
*/


// SOME KEY INTERACTIONS THAT ENABLE US TO CHANGE OUR VARIABLES
// AND THEREFORE CHANGE OUR VISUAL IN REAL TIME

void keyPressed() {
  
  // Shapes Loaded
  if(key == '1') index = 0;
  if(key == '2') index = 1;
  if(key == '3') index = 2;
  if(key == '4') index = 3;
  if(key == '5') index = 4;
  
  if(key == 'r') {
   seed = (int)random(10000);
  }
  
  // PDF Export
  if(key == 'e') {
   exportPDF = true; 
  }
  
  // Increase the size of our cirlces
  if (key == '+') {
    shapeSize += 1;
  }
  
  // Decrease the size of our cirlces
  if (key == '-') {
    shapeSize -= 1;
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
}

