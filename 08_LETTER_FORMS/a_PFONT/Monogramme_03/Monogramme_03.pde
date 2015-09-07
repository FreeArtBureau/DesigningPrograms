/*
 SKETCH : MONOGRAMME_02
 PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////
PFont font;
char letter;
float xPos, yPos;

float fontSize;
float angle;
int c; // var pour varier la teinte

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 600);
  background(0);
  colorMode(HSB, 360, 100, 100); 
  smooth();
  noStroke();
  frameRate(8); // 8 images/seconde
  font = createFont("AnonymousPro-Bold", 500);
  c = 0;
  letter = ' ';
  textAlign(CENTER, CENTER);

  xPos = width/2;
  yPos = height/3;

  angle = radians(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  colorMode(RGB);
  fill(0, 7);
  rect(0, 0, width, height);
  colorMode(HSB, 360, 100, 100);
  fill(c, 100, 100, 50);
  // Autonomous size based on sin() function
  fontSize = abs(sin(angle*0.5) * 800);
  fontSize = constrain(fontSize, 400, 800); 
  textFont(font, fontSize);

  // Autonomous motion
  text(char((int)random(35, 110)), xPos, yPos);

  angle += 0.05;
  c = (c+1)%360;
}

/////////////////////////// FUNCTIONS ////////////////////////////

// Simple key interaction
void keyPressed() {
  if (keyPressed)
    letter = key;
}

