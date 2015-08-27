/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////

int changeStrokeCap;
float lineLength; 
int seed;

// Grid layout based on columns (xAxis) & rows (yAxis)
int numCol, numRows; 
// Grid resolution = number of repetitions
float gridResX;
float gridResY;

int mode = 0; // different tiling systems
boolean showCenter = false;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 600);
  noFill();
  smooth();

  numCol = 10;
  numRows = 10;

  lineLength = 20.0;
  gridResX = 40;
  gridResY = 0;
  gridResY = gridResX; // Uniform resolution
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(255);
  randomSeed(seed);
  translate(width/2, height/2); // center everything

  strokeCap(changeStrokeCap);

  numRows = constrain(numRows, 1, 100);
  numCol = constrain(numCol, 1, 100);
  

  // Here is different way of creating a grid structure / tiling system
  // based on our variables for numCol & numRows + grid resolution.
    
  // These make sure everything is centered
  float centerX = gridResX * (numCol-1) / 2;
  float centerY = gridResY * (numRows-1) / 2;
  
  // Here we change the tiling system : square OR hexagonal
  if (mode == 0) { // SQUARE
      gridResY = gridResX; // Uniform resolution
  } 
  else if (mode == 1) { // HEX
    gridResY = sqrt(3) / 2 * gridResX;
  } 

  for (int gridY = 0; gridY<numRows; gridY++) {
    for (int gridX = 0; gridX<numCol; gridX++) {

      // Here is our little calculation for x & y postiions
      // based on our grid resolution variables and offset calculations
      float posX =  gridX * gridResX - centerX;
      float posY =  gridY * gridResY - centerY;
     
     // Check tiling system and adjust accordingly
      if (gridY % 2 == 0 && mode == 1) 
      posX += gridResX/2;

      /* // Possible offset interaction
      float shiftX = random(-mouseX,mouseX)/20;
      float shiftY = random(-mouseX,mouseX)/20;
      */
       
      // Lets also keep all our graphic elements centered
      // in relation to posX & posY
      pushMatrix();
      translate(posX, posY);
      
      //THIS random var PRODUCES A VALUE OF 0 OR 1
      int dice = (int) random(0, 2);

      if (dice == 0) {
        strokeWeight(mouseX/10);
        stroke(255,0,0);
        line(-lineLength, -lineLength, lineLength, lineLength);       
      }

      if (dice == 1) {
        strokeWeight(mouseY/10);
        stroke(0,0,255);
        line(-lineLength, lineLength, lineLength, -lineLength);
      }
      
       popMatrix();
    }
  }
}


