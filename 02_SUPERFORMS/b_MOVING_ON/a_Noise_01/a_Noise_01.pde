/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////

float circleDiameter;
int xInterval, yInterval;
float thickness;
// This boolean variable turns on/off animation
// press the 'p' button to activate/disactivate
boolean animate = false;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(650, 450);
  background(255);
  smooth();
  noStroke();
  circleDiameter = 20;
  xInterval = 60;
  yInterval = 50;
  thickness = 0.5;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);


  for (int y = 75; y < height-50; y += yInterval) {       
    for (int x = 50; x < width-50; x += xInterval) {        

      // 2 variables for mouse interaction
      float noiseAmm = map(mouseX, 0, width, 0.001, 0.1);
      float noiseFact = map(mouseY, 0, height, 1, 100);
      
      fill(255);
      // Check if animating
      if (animate) {
        float diaNoise = noise(x*noiseAmm, y*noiseAmm, frameCount*noiseAmm) * noiseFact;
        ellipse( x, y, circleDiameter+diaNoise, circleDiameter+diaNoise);
      }

      // if not then this...
      else {
        float diaNoise = noise(x*noiseAmm, y*noiseAmm) * noiseFact;
        ellipse( x, y, circleDiameter+diaNoise, circleDiameter+diaNoise);
      }
    }
  }
}


