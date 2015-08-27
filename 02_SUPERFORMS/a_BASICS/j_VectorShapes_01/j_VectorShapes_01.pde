/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////
import processing.pdf.*;
boolean exportPDF = false;
PShape[] myShapes;
int index;
int shapeSize;
int xInterval, yInterval;
int seed;

// Here is an array list of colours for our shapes
color[] MyColors = {  #440008, #605521, #988432, #D9A54E, #9E3711, #325104, #04514F
};


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(650, 450);
  background(255);
  smooth();
  myShapes = new PShape[5];
  // Using a FOR loop to load shapes ;–)
  for(int i=0; i<myShapes.length; i++) {
  myShapes[i] = loadShape("square-"+nf(i,3)+".svg");
  myShapes[i].disableStyle();
  }

  index = 0;
  shapeSize = 50;
  xInterval = 25;
  yInterval = 25;
  seed = (int)random(10000);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
   if (exportPDF) {
    beginRecord(PDF, "Vector_Image_##.pdf");
  }
  background(255);
  randomSeed(seed);
  shapeMode(CENTER);
  
  // var to control rotation of our shape
  float my = map(mouseX,0,width,0,TWO_PI);
  float noiseFACT = map(mouseY, 0, height, 0.5, 30.0);
  
  for (int y = 75; y < height-50; y += yInterval) {       
    for (int x = 75; x < width-50; x += xInterval) {        
      pushMatrix();
      translate(x,y);
      // adding some noise/random variation
      float jit = noise(x*0.05, y*0.05) * noiseFACT;
      rotate(my + jit);
      noStroke();
      // Pick some random colour with our little function below
      color c = somecolour();
      fill(c);
      
      shape(myShapes[index], 0, 0, shapeSize, shapeSize);
      popMatrix(); 
    }
  }
    if (exportPDF) {
    endRecord();
    exportPDF = !exportPDF;
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
//PICK SOME RANDOM COLOUR ROUTINE/FUNCTION
color somecolour() {
  return MyColors[int(random(MyColors.length))];
  //RETURNS A VALUE TAKEN FROM OUR LIST OF COLORS DECALRED ABOVE.
}
