//Building Blocks 2011
//Processing Functions
/*
Linear Interpolation
 Useful for blending between two values. 
 lerp(low,high,amount);
 */

///////////////////// GLOBALS ////////////////////
float low = 1;
float high;
float amount = 10;

PFont a;

///////////////////// SETUP ////////////////////
void setup() {
  size(300, 200);
  background(150);
  smooth();
  a = createFont("Helvetica", 12);
  textFont(a);
  cursor(CROSS);
  rectMode(CENTER);
}


///////////////////// DRAW ////////////////////
void draw() {
  background(150);
  high = map(mouseX, 0, width, 0, 255/amount);
  // high = mouseY;
  float col = lerp(low, high, amount);  
  
  fill(col);
  rect(width/2, height/2, 100, 100);
  fill(0);
  text(col, mouseX, mouseY+20);
   text(high, mouseX, mouseY+40);
}

