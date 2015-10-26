/**
 * Cheese & Moiré_02
 * A functional function for making graphic cheeses ;–) 
 * 
 * In this version, added rotational on/off
 * and experimented with colour too
 * MW 23.10.2015
 *
 * REF : 
 *
 */

/////////////////////////// GLOBALS ////////////////////////////
boolean ANIME = true; // global var for setting animation
/////////////////////////// SETUP ////////////////////////////

void setup() {
  colorMode(HSB, 360, 100, 100);
  background(1, 100, 0);
  size(500, 500);
  smooth();
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(1, 100, 0);

  // @params: x & y postions, number of cheese slices, diameter size, rotate
  //cheese(150, 150, 25, 100, true);

  float x = width/2;
  //float y = height/2+sin(frameCount*0.05)*3.3;
  
  cheese(x, height/2, 25, 290, false);
  cheese(x, height/2, 50, 290, true);
}

/////////////////////////// FUNCTIONS ////////////////////////////

// @params: x & y postions, number of cheese slices, diameter size, rotate
void cheese(float _x, float _y, int _numSlices, float _dia, boolean _rotate) {

  noStroke();
  //float h = frameCount%360;
  //fill(h, 100, 100);
  fill(0,0,100);
  
  float cheeseSlices = TWO_PI/_numSlices;
  float refineLines = 3.0; 
  float speed = 0.0035;
  float yAnime;
  if (ANIME) {
    yAnime = map(sin(frameCount*0.0475), -1, 1, 0, 35);
  } else {
    yAnime = 0.0;
  }
  for (int i=0; i<_numSlices; i++) {

    pushMatrix();
    translate(_x, _y); 
    if (_rotate == true) { 
      rotate(frameCount*speed);
    }
    rotate(i*cheeseSlices);

    arc(0, yAnime, _dia/refineLines, _dia, (PI*2.5)-(cheeseSlices/2), (PI*2.5)+(cheeseSlices/2));
    popMatrix();
  }
}

