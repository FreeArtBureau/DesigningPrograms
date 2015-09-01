/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////

PFont myFont;
float angle;
float radius = 200;
String mode = "mouse";
boolean auto = false;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(500, 300);
  background(0);
  stroke(0);
  smooth();
  myFont = createFont("helvetica", 12);
  textFont(myFont); 
  angle = 0.0;
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  pushMatrix();
  translate(250, 150);

  if (auto) {
    angle += 0.15;
  } else {
    // Using mouseX position to change angle
    angle = map(mouseX, 0, width, 0, 360);
  }
  // OUR FORMULA FOR CALCULATING X & Y
  float x = cos(radians(angle)) * radius;
  float y = sin(radians(angle)) * radius;

  //DRAW CIRCLE & LINE
  noStroke();
  fill(0, 0, 255);
  ellipse(0, 0, radius, radius);
  stroke(255);
  strokeWeight(5);
  line(0, 0, x/2, y/2);
  pushStyle();

  fill(235, 75, 0);
  noStroke();
  ellipse(x/2, y/2, 20, 20);
  popStyle();
  popMatrix();

  // angle += 0.15;  


  // TEXT DISPLAYS
  pushMatrix();
  fill(255);
  textSize(12);
  //Used round() function to calculate integers
  //And % is used so that we go back to 0 after reaching 360
  text("Degrees = " + round(angle%360), 30, 70); 
  text("Radians = " + radians(angle%360), 30, 85); 

  //NB. The point of origin (x,y=0) is at the center of the circle.
  text("XPos = "+ round(x/2), 30, 40);
  text("YPos = "+ round(y/2), 30, 55);
  textSize(18);
  text("Press key to change mode = " + mode, 30, 280); 

  popMatrix();
}




/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() {
  auto = !auto;
    if (auto) mode = "automatic";
  if (!auto) mode = "mouse";
}

