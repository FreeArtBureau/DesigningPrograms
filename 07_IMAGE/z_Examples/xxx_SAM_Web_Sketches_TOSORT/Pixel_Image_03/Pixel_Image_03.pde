/*
PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////
PImage IMG;
int GRIDREZ; 
int FONTSIZE;
float THETA, DIR, INC;
boolean DIRECTION;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(255);
  noStroke();
  strokeWeight(0.4);
  IMG = loadImage("drunken_text.png");
  size(IMG.width, IMG.height, P3D);
  THETA = radians(0);
  GRIDREZ = 5;
  DIR = 1;
  INC = 0.000001;
  DIRECTION = true;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  //randomSeed(1000);

  for (int x=0; x<IMG.width; x+=GRIDREZ) {
    for (int y=0; y<IMG.height; y+=GRIDREZ) {

      color c = IMG.get(x, y);
      // fill(c);
      stroke(c);

      float z = brightness(c)/mouseX*10;
      line(x, y, z, x, y, 0);

      pushMatrix();
      translate(x, y, z);
      popMatrix();
    }

    THETA += INC * DIR;
    translate(width/2, height/2, 0);
    rotateY(THETA);    
    translate(-width/2, -height/2, 0);
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      GRIDREZ++;
    } 
    if (keyCode == DOWN) {
      GRIDREZ--;
    }
    if (keyCode == RIGHT) {
      INC += .0000005 * DIR;
    } 
    if (keyCode == LEFT) {
      INC -= .0000005 * DIR;
    }
    constrain(GRIDREZ, 1, 40);
  } 

  if (key == 'd') {
    DIRECTION = !DIRECTION;
    if (DIRECTION) {
      DIR = 1;
    }
    else {
      DIR = -1;
    }
  }
  if (key == 's') {
    save("normal_###.png");
    SaveHiRes(2);
    exit();
  }
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

