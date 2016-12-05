//Building Blocks 2011
//Processing Functions
/*
Distance
 Calculates the distance between two points. 
 dist(x1,y1,x2,y2 );
 */

///////////////////// GLOBALS ////////////////////
float x = 10;
float y = 10;
float x2;
float y2;
PFont a;

///////////////////// SETUP ////////////////////
void setup() {
  size(300, 200);
  background(150);
  smooth();
  a = createFont("Helvetica", 12);
  textFont(a);
  cursor(CROSS);
}


///////////////////// DRAW ////////////////////
void draw() {
  background(150);
  x2 = mouseX;
  y2 = mouseY;
  float result = dist(x, y, x2, y2);    
  line(x, y, x2, y2);
  ellipse(x, y, 7, 7);

  text(result, mouseX, mouseY+20);
}

