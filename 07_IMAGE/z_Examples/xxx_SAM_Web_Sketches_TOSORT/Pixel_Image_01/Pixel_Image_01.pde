/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////

PImage IMG;
int GRIDREZ = 5;
int FILTERMODE;
float COLFILTER;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(0);
  strokeWeight(0.3);
  noFill();
  imageMode(CENTER);
  IMG = loadImage("drunken_text.png");
  size(IMG.width, IMG.height, P2D);
  FILTERMODE = 0;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  // 
  float fact = map(mouseY, 0, height, 0.2, 8.0);
  float filterFact = map(mouseX, 0, width, 0.2, 4.0);

  for (int x=0; x<=IMG.width; x+= GRIDREZ) {
    for (int y=0; y<=IMG.height; y+= GRIDREZ) {

      // Colour
      color col = IMG.get(x, y); // grab pixel colour
      float pixelBright = (brightness(col)/255)*fact; // grab brightness

      switch(FILTERMODE) {
      case 0:
        COLFILTER = (red(col)/255)*filterFact; // grab red Pixels      
        break;

      case 1:
        COLFILTER = (green(col)/255)*filterFact; // grab green Pixels
        break;

      case 2:
        COLFILTER = (blue(col)/255)*filterFact; // grab blue Pixels
        break;
      }

      // Draw graphics
      float dotDia = COLFILTER/GRIDREZ+(COLFILTER*2);
      Dots(x, y, dotDia, col);

      float xCrossLen = pixelBright/GRIDREZ+(pixelBright*2);
      XCross(x, y, xCrossLen, col);
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
// KEYS
void keyPressed() {
  // Change grid resolution
  if (key == CODED) {
    if (keyCode == UP) {
      GRIDREZ++;
    } 
    else if (keyCode == DOWN) {
      GRIDREZ--;
    }
  }
  // Change filter mode
  if (key == '1') {
    FILTERMODE = 0;
  }
  if (key == '2') {
    FILTERMODE = 1;
  }
  if (key == '3') {
    FILTERMODE = 2;
  }

  if (key == 's') {
    save("normal_###.png");
    SaveHiRes(2);
    exit();
  }
}

// Graphic functions
void XCross(int x, int y, float len, color c) {
  pushMatrix();
  translate(x, y);
  stroke(c);
  strokeWeight(0.3);
  line(-len, -len, len, len); 
  line(-len, len, len, -len);
  popMatrix();
}

void Dots(int x, int y, float dia, color c) {
  pushMatrix();
  translate(x, y);
  fill(c);
  noStroke();
  ellipse(0, 0, dia, dia);
  popMatrix();
}

// HI_RES OUTPUT - Note that the program exits once this operation has finished. Wait for export !
void SaveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, P2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires_###.png");
}
