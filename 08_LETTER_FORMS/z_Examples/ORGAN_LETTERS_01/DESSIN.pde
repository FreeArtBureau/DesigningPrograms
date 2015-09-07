float noiseVal;
float noiseScale = 0.001;
float noiseCount = 0.0;
float noiseSpeed = 0.002;

float xCount, xSpeed;
float yCount, ySpeed;

float theta;
float angle;
float angleDelta;
float xv, yv;
float speed = 125;
float lineFX;
color c;
boolean lines = true;
boolean freeze = false;
boolean NOISE_LENGTH;
boolean ANIMATE;
int noiseRes=6;
int xTotal = int(600 / noiseRes);
int yTotal = int(600 / noiseRes);  




/////////////////////////////////// On charge nos images par ici
void glyphInit() {
  glyphs = new PImage[26];

  for (int i=0; i<glyphs.length; i++) {
    glyphs[i] = loadImage("Found/Found_"+nf(i, 3)+".png");
    glyphs[i].resize(600, 600);
  }
  imageMode(CENTER); 
}
