
/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////
//* IMPORTANT *//
// import PDF for vector export of images
import processing.pdf.*; 
// boolean to turn on/off PDF export
boolean exportPDF = false; 

int circleDiameter;
int xInterval, yInterval;
float thickness;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(650, 450);
  background(255);
  smooth();
  circleDiameter = 50;
  xInterval = 75;
  yInterval = 75;
  thickness = 0.5;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  // NOTE : all drawing attributes must be in draw(){}
  // If exportPDF is true we begin the export
  if (exportPDF) {
    beginRecord(PDF, "Vector_Image_##.pdf");
  }
  
  background(255);
  noFill();
  for (int y = 75; y < height-50; y += yInterval) {       
    for (int x = 50; x < width-50; x += xInterval) {        
      stroke(0);
      strokeWeight( thickness );

      ellipse( x, y, circleDiameter, circleDiameter);
    }
  }
  
  // if exportPDF is true we end export 
  // and update our boolean state
  if (exportPDF) {
    endRecord();
    exportPDF = !exportPDF;
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
// SOME KEY INTERACTIONS THAT ENABLE US TO CHANGE OUR VARIABLES
// AND THEREFORE CHANGE OUR VISUAL IN REAL TIME

void keyPressed() {
  // Basic bitmap using saveFrame (formats : .jpg / .tiff / .png / .tga)
  if (key == 's') {
    saveFrame("ScreenCapture_##.png");
  }
  
  // Key p turns our boolean 'on' for exporting PDF
  if (key == 'p') {
    exportPDF = true;
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

