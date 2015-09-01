/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */

/////////////////////////// GLOBALS ////////////////////////////
// Geometry
float angle;
float radius = 100;
float x, x2;
// Speed of angle change
float frequency = 1.0;


// used to create font
PFont myFont;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(760, 380);
  background (127);
  smooth();
  // generate processing font from system font
  myFont = createFont("helvetica", 12);
  textFont(myFont);
  //angle = 0.0;
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background (0);
  noStroke();
  fill(235,125,0);
  float centCircleX = 150;
  float centCircleY = 175;
  // DRAW CIRCLE
  ellipse(centCircleX, centCircleY, radius*2, radius*2);

  // Calculate x & y positions for square that 
  // moves around circle's circumfrence
  float px = centCircleX + cos(radians(angle))*(radius);
  float py = centCircleY + sin(radians(angle))*(radius);

  // Draw the square & lines
  rectMode(CENTER);
  stroke(255);
  strokeWeight(5);
  line(centCircleX, centCircleY, px, py);


  // draw dynamic line connecting 
  // circular path with wave
  stroke(255);
  line(px, py, centCircleX+radius+x, py);

  fill(0, 0, 255);
  noStroke();
  rect (px, py, 25, 25);

  // draw static curve - y = sin(x)
  float angle2 = 0;
  stroke(255, 255, 0);
  for (int i = 0; i< width; i++) {
    float px2 = centCircleX + cos(radians(angle2))*(radius);
    float py2 = centCircleY + sin(radians(angle2))*(radius);
      point((centCircleX+radius)+i, py2);
      angle2 += frequency;
  }

  // send small ellipse along sine curve
  // to illustrate relationship of circle to wave
  noStroke();
  fill(255, 0, 0);
  ellipse(centCircleX+radius+x, py, 25, 25);

  angle += frequency;
  println(angle);
  x+=1;

  // when little ellipse reaches -360
  // reinitialize some variables
  if (angle >= 360.0) {
    x = 0;
    angle = 0.0;
  }

  // TEXT DISPLAY
  fill(255);
  //text("y = sin x", 35, 345);
  text("angle = " + angle, 105, 345);
}

