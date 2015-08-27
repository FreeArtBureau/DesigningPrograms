/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
  //THESE CHANGE THE STROKE ATTRIBUTES
  if (key == '1') changeStrokeCap = ROUND;
  if (key =='2') changeStrokeCap = SQUARE;
  if (key == '3') changeStrokeCap = PROJECT;
  
  if(key == '5') mode = 0;
  if(key == '6') mode = 1;
   
   
  if (key == 'r') {
    seed = (int)random(10000);
  }

  // Increase the line length
  if (key == 'a') {
    lineLength += 0.5;
  }

  // Decrease the line length
  if (key == 'z') {
    lineLength -= 0.5;
  }

  // Increase the size of our grid on x axis
  if (key == 'm') {
    gridResX += 0.5;
  }

  // Decrease the size of our grid on x axis
  if (key == 'k') {
    gridResX -= 0.5;
  }
  
    // Increase the size of our grid on y axis
  if (key == 'o') {
    gridResY += 0.5;
  }

  // Decrease the size of our grid on y axis
  if (key == 'l') {
    gridResY -= 0.5;
  }

  // Increase the number of rows
  if (keyCode == UP) {
    numRows += 1;
  }

  // Decrease  the number of rows
  if (keyCode == DOWN) {
    numRows -= 1;
  }

  // Increase the number of columns
  if (keyCode == RIGHT) {
    numCol += 2;
  }

  // Decrease the number of columns
  if (keyCode == LEFT) {
    numCol -= 2;
  }
}

