/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////

float circleDiameter;
int xInterval, yInterval;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(650, 450);
  background(0);
  smooth();
  noStroke();
  circleDiameter = 1;
  xInterval = 60;
  yInterval = 5;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //Fade effect
  fill(0, 15);
  rect(0, 0, width, height);

  // Constrain our vars between min 1, max 100
  yInterval = constrain(yInterval, 1, 100); 
  xInterval = constrain(xInterval, 1, 100);

  for (int y = 75; y < height-50; y += yInterval) {       
    for (int x = 50; x < width-50; x += xInterval) {        

      // 2 variables for mouse interaction
      float nAmm = map(mouseX, 0, width, 0.00001, 0.001);
      float nFact = map(mouseY, 0, height, 1, 37);

      // Creates a slightly more organic & natural animation
      float snx = sin(frameCount * nAmm) * nFact;
      float sny = sin(frameCount * nAmm) * nFact;
      float snz = frameCount*nAmm;

      fill(255);

      float diaNoise = noise(x*0.01+snx, y*0.01+sny, snz) * 33;
      ellipse( x, y, circleDiameter+diaNoise, circleDiameter+diaNoise);
    }
  }
}

