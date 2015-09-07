/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////
PImage img;
float x, y;
float freq = 0;
float amp = 10;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  background(0);
  smooth();
  noStroke();
  x = 10;
  y = 50;
  img = loadImage("japaneselady.jpg");
  size(img.width, img.height);
  frameRate(250);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  x+=0.5;

  color c = img.get((int)x, (int)y);
  color f = int(brightness(c));

  if (f >=110) {
    fill(c, f);
    y += sin(freq * 0.75)*amp;
    //freq+=0.05;
    //freq += noise(x*0.01, y*0.01) * 5;// original *0.005) * 5
    freq += noise(x*0.005, y*0.005) * 5;

    ellipse(x, y, 2, 2);
  }

  // Keep the animation within height & width of image
  if (x>=width-10) {
    y+=10; // original 10
    x = 10;
  }

  if (y>=height-10) {
    y = 50;
    x = 10;
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  if (key == 's')saveFrame("capture_###.png");
}

