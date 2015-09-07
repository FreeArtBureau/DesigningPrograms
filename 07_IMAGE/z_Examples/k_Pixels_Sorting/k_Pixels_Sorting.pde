/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////
int mode = 0; // 3 modes (0, 1, 2)
//MODE:
//0 -> black
//1 -> bright
//2 -> white
//b(16777216)

PImage img;
//String imgFileName = "ml";
//String fileType = "jpg";

int loops = 1;

int blackValue;           // Valeur du noir
int brigthnessValue;      // Luminosité (seuil)
int whiteValue;           // Valeur du blanc

int row;
int column;

boolean saved = false;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(255);
  blackValue = -91223700;    // Valeur du noir
  brigthnessValue = 33;     // Luminosité (seuil)
  
//  whiteValue = (int)random(-1000,100);
 whiteValue = -8967707;
  println(whiteValue);
  row = 0;
  column = 0;
  //  img = loadImage(imgFileName+"."+fileType);
  img = loadImage("wood.jpg");
  size(img.width, img.height);
  image(img, 0, 0);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  while (column < width-1) {
    img.loadPixels(); 
    sortColumn();
    column++;
    img.updatePixels();
  }
  /*
  while (row < height-1) {
    img.loadPixels(); 
    sortRow();
    row++;
    img.updatePixels();
  }

*/
  image(img, 0, 0);
  /*
  if(!saved && frameCount >= loops) {
   saveFrame(imgFileName+"_"+mode+".png");
   saved = true;
   println("DONE"+frameCount);
   // System.exit(0);
   }
   */
}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
  // RESTART
  if (key == 'g') {
    setup();
  }

  // PNG EXPORT HI_DEF
  if (key == 's') {
    save("normal.png");
    saveHiRes(4); // La résolution de ton image en export - Entre 2 > 4
    exit();
  }
}

void saveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires_###.png");
}

