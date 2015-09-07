import processing.opengl.*;

/*
CODE FROM ANDREW GLASSNER'S BOOK
PROCESSING FOR VISUAL ARTISTS.
 */


int Wsize = 300;
int Speed = 200;
float NumLayers = 37.0;

void setup() {
  size(Wsize,Wsize, OPENGL);
}

void draw() {
  background(0);
  color c0 = color(0);
  color c1 = color(255);
  color thisColor = c0;
//float jit = random(0.0158,0.159);

  float layerHeight = 1.0/NumLayers;
  loadPixels();//LOAD OUR PIXELS HERE FOR THE PIXEL ARRAY
  for(int y=0; y<Wsize; y++) {
    for(int x=0; x<Wsize; x++) {
      
      float noiseVal = noise(x*.015, y*.015);    
      float noiseBump = lerp(0,layerHeight,(frameCount % Speed)/(1.0*Speed));
      //MODULOS CALCULATES THE REMAINDER OF A SUM
      //LERP CALCULATES A NUMBER BETWEEN 2 NUMBS AT A SPECIFIC INCREMENT
      //HERE THE INC IS BETWEEN 0.01 TO 0.99
      //AFTER WHICH IT REPEATS.

      //THIS IS SOME KIND OF COLOUR SWITCHING ALGORITHM
      int whichColor = int((noiseVal+noiseBump)/layerHeight);
      int startingColor = (((frameCount/Speed) % 2) == 0) ? 0 : 1;
      if (((whichColor+startingColor)%2) == 0) thisColor = c0;
      else thisColor = c1;

      //set(x,y,thisColor);
      pixels[(y*width)+x] = thisColor; //USE PIXELS ARRAY FOR A BETTER PERFORMANCE
    }
  }
  updatePixels();//UPDATE HERE THE PIXELS
  //println(frameRate);
}

