/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////

int numberOfSides;
int xInterval, yInterval;
float thickness;
int seed;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(650, 450);
  background(255);
  smooth();
  noFill();
  strokeCap( SQUARE );
  numberOfSides = 4;
  xInterval = 75;
  yInterval = 75;
  thickness = 0.5;
  seed = (int)random(10000);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  randomSeed(seed);

  float polySize = (int)map(mouseX, 0, width, 10, 100);
  float my = map(mouseY, 0, height, 0, TWO_PI);

  strokeWeight( abs(thickness) );

  for (int y = 75; y < height-50; y += yInterval) {       
    for (int x = 75; x < width-50; x += xInterval) {        
      pushMatrix();
      translate(x, y);
      rotate(my);
      polygon(0, 0, numberOfSides, polySize,color(255, 0, 0));
      popMatrix();

      pushMatrix();
      translate(x, y);
      rotate(-my);
      polygon(0, 0, numberOfSides, polySize, color(0, 0, 255));//TRY DIFF VALUES AND *JIT NOT +JIT
      popMatrix();
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

// Function that draws a regular polygon
void polygon(float x, float y, int numberOfSides, float sizes, color c) {

  float radius = sizes;
  float angle = TWO_PI/numberOfSides;
  stroke(c);
  beginShape();
  pushMatrix();
  translate(x, y);
  for (int i = 0; i<numberOfSides; i++) {

    x = cos(angle*i) * radius;
    y = sin(angle*i) * radius;

    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}

