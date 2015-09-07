/*
 SKETCH : MONOGRAMME
 PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////
PFont font;
char letter;
float xPos, yPos;

float fontSize;
float angle;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 600);
  background(0);
  smooth();
  noStroke();
  frameRate(8); // 8 images/seconde
  font = createFont("AnonymousPro-Bold", 500);
  
  letter = ' ';
  textAlign(CENTER, CENTER);

  xPos = width/2;
  yPos = height/3;
  
  angle = radians(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(243); 
  fill(0, 7);
  rect(0, 0, width, height);
  fill(0, 255, 255, 33);
  // Autonomous size based on sin() function
  fontSize = abs(sin(angle*0.5) * 800);
  
  //fontSize = constrain(fontSize, 100,400); 
  textFont(font,fontSize);
  
  text(letter, xPos, yPos);
  
  // Autonomous motion
  // text(char((int)random(35,110)), xPos, yPos);
  
  angle += 0.05;
}

/////////////////////////// FUNCTIONS ////////////////////////////

// Simple key interaction
void keyPressed() {
  if (keyPressed)
    letter = key;
}

