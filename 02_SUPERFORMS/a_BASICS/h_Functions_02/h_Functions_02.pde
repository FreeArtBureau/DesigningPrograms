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
float lineLength; 

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(650, 450);
  background(255);
  smooth();
  noFill();
  strokeCap( SQUARE );
  circleDiameter = 25;
  xInterval = 75;
  yInterval = 75;
  thickness = 0.5;
  seed = (int)random(10000);
  lineLength = 10.5;  
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  randomSeed(seed);


  for (int y = 75; y < height-50; y += yInterval) {       
    for (int x = 75; x < width-50; x += xInterval) {        
      strokeWeight( abs(thickness) );
      // generate a random number between 0 & 6
      int dice = (int)random(0, 7);

      if (dice<=2) {
        stroke(0);
        ellipse( x, y, circleDiameter, circleDiameter);
      }
      if (dice==3) {
        stroke(0, 0, 255);
        cross( x, y);
      }
      if (dice>3) {
        stroke(255, 0, 0);
        
       // Added a new function that draws regular polygons
       // Here a two new interactions with the mouse :
       // mouseX changes the number of polygon sides
       // mouseY changes the size of the polygons
       
       int numPolySides = (int)map(mouseX, 0, width, 1, 16);
       float polySize = map(mouseY, 0, height, 1, 100);
       
        polygon(x, y, numPolySides, polySize);
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
// Any of these functions can be used and you can make your own too ;–)

// Function that draws a cross
void cross(int x, int y) {
  pushMatrix();
  translate(x, y);
  line(-lineLength, -lineLength, lineLength, lineLength);
  line(-lineLength, lineLength, lineLength, -lineLength);
  popMatrix();
}


// Function that draws a repetition of lines
void bands(int x, int y) {
  pushMatrix();
  translate(x, y-25);
  for (int i=0; i<25; i+=5) {
    line(i-lineLength, i+lineLength, i+lineLength, i+lineLength);
  }
  //line(-lineLength, lineLength, lineLength, -lineLength);
  popMatrix();
}


// Function that draws a regular polygon
void polygon(float x, float y, int numberOfSides, float sizes) {

  float radius = sizes;
  float angle = TWO_PI/numberOfSides;
  beginShape();
  pushMatrix();
  translate(x, y);
  for (int i = 0; i<numberOfSides; i++) {

    x = cos(angle*i)*radius;
    y = sin(angle*i)*radius;

    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}

