/*
 * COLOUR STRATEGY_02
 * Makes a random palette of set colours from an image
 *
 * Author & date
 * Function taken from J Tarbell 
 * complexification.net
 *
 * http://devmag.org.za/2012/07/29/how-to-choose-colours-procedurally-algorithms/

 */

/////////////////////////// GLOBALS ////////////////////////////
PImage IMG;
int PALETTE_SIZE = 30;

// color parameters
int MAX_PAL = 400;
int NUM_PAL = 0;
color[] GOOD_COLOUR = new color[MAX_PAL];
color MYC;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke();
  takecolor("abstract.jpg");
  MYC = somecolor();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  randomSeed(1000);
  int x = PALETTE_SIZE/2;
  int y = PALETTE_SIZE/2;
  // draw Palette of colours
  for (int i=0; i<GOOD_COLOUR.length; i++) {
    MYC = somecolor();
    //fill(red(GOOD_COLOUR[i]), green(GOOD_COLOUR[i]), blue(GOOD_COLOUR[i]));
    fill(MYC);
    rect(x, y, PALETTE_SIZE/2, PALETTE_SIZE/2);
    x+=PALETTE_SIZE;
    if (x>=width-PALETTE_SIZE/2) {
      x = PALETTE_SIZE/2;
      y += PALETTE_SIZE;
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
// COLOR METHODS ----------------------------------------------------------------

color somecolor() {
  // pick some random good color
  return GOOD_COLOUR[int(random(NUM_PAL))];
}

void takecolor(String fn) {
  PImage b;
  b = loadImage(fn);
  image(b, 0, 0);

  // This routine makes sure we only add new colours to the palette
  for (int x=0; x<b.width; x++) {
    for (int y=0; y<b.height; y++) {
      //color c = get(x, y);
      color c = get((int)random(x), (int)random(y));
      boolean exists = false;
      for (int n=0; n<NUM_PAL; n++) {
        if (c==GOOD_COLOUR[n]) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        // add color to pal
        if (NUM_PAL<MAX_PAL) {
          GOOD_COLOUR[NUM_PAL] = c;
          NUM_PAL++;
        }
      }
    }
  }
}

