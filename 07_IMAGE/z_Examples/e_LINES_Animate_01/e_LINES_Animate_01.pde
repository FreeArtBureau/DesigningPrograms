/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////


PImage flowers;
int y = 0;
float yPos;
int dir = 1;
boolean stopAnime = false;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 200);
  background(255);
  flowers = loadImage("flowers.jpg");
  yPos = 0.5;
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  // image(flowers, 0, 0);
  //  y = constrain(yPos, 0, 300);

  for (int i = 0; i < width; i++) {
    color c = flowers.get(i, (int)yPos);
    strokeWeight(1);
    stroke(c);
    line(i, 0, i, height);
  }

  // stroke(255);
  // line(0, yPos, 400, yPos);

  yPos+=0.5*dir;

  if (yPos >= height) {
    dir = -1;
  }

  if (yPos <= 0.0) {
    dir = 1;
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
  if (key == 'p') {
    stopAnime = !stopAnime;
    if (stopAnime) {

      noLoop();
    } else {
      loop();
    }
  }

  if (key == 's') {
    save("normal_###.png");
    SaveHiRes(4);
    exit();
  }
}
// HI_RES OUTPUT - Note that the program exits once this operation has finished. Wait for export !
void SaveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires_###.png");
}

