/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////
PFont FONT;
PImage IMG;
int GRIDREZ; 
int FONTSIZE;
boolean RAND1 = false;
int SEED;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(255);
  noStroke();
  // Change font here. Choose a font installed on the shitstem
  FONT = createFont("Monospaced", 50);
  IMG = loadImage("drunken_text.png");
  size(IMG.width, IMG.height, P2D);
  FONTSIZE = 1;
  GRIDREZ = 5;
  SEED = 1000;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  randomSeed(SEED);
  
  textFont(FONT, FONTSIZE+GRIDREZ);
  for (int x=0; x<IMG.width; x+=GRIDREZ) {
    for (int y=0; y<IMG.height; y+=GRIDREZ) {

      color c = IMG.get(x, y);
      fill(c);
      if(RAND1) {
      char glyph = ShakeMyFont();
       text(glyph, x, y); 
      }else {
      //textFont(FONT,random(1,10));     
      text((char)random(60, 63), x, y);
      }
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
   // Change grid resolution
  if (key == CODED) {
    if (keyCode == UP) {
      GRIDREZ++;
    } 
    else if (keyCode == DOWN) {
      GRIDREZ--;
    }
    constrain(GRIDREZ, 1, 40);
    
    // Change font size
    if (keyCode == RIGHT) {
      FONTSIZE++;
    } 
    else if (keyCode == LEFT) {
      FONTSIZE--;
    }
  }
  
  if(key == '1') {
    RAND1 = !RAND1;
    SEED = (int)random(1000);
  }  
    if (key == 's') {
    save("normal_###.png");
    SaveHiRes(2);
    exit();
  }
}

// Random character function
char ShakeMyFont() {
  char glyphRand = 0;
  
  int dice = (int)random(4);
  if (dice == 0) {
    glyphRand = (char)random(65,90);
  }
   if (dice == 1) {
    glyphRand = 43;
  }
   if (dice == 2) {
    glyphRand = 43;
  }
  return glyphRand;
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
