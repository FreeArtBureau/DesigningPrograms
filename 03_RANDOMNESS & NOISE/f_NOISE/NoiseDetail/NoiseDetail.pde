/*
INTRO AU BRUIT PERLIN
BASÉ SUR UN SKETCH DE
JEAN-MICHEL GÉRIDAN 2012

*/


float yVal;
float noiseScale=0.007; //echelle
float noiseCount=0;


void setup() {
  size(300, 150);
  noiseDetail(6, 0.1); //distribution harmonique du bruit (Octave + facteur).
}

void draw() {
  background(255);

  for (int x = 0; x < width; x+=2) {
    yVal = noise((noiseCount+x) * noiseScale );
    line(x, 0, x, yVal*height);
  }
  
    noiseCount+=0.5;
}

