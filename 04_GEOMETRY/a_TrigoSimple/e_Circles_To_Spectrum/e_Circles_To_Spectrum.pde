

/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
ControlP5 mControl;

int radius = 150;
PFont myFont;
int NumSegments = 5;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(150);
  smooth();
  //We use the HSB mode where Hue will be controlled
  //by the number of segments in our shape
  colorMode(HSB, 360, 255, 255);
  mControl = new ControlP5(this);
  Slider s = mControl.addSlider("NumSegments", 0, 60, 5, 10, 20, 200, 10);
  s.setNumberOfTickMarks(20);
  myFont = createFont("helvetica", 12);
  textFont(myFont);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  //Calculate the angle change based on number of segments we have
  //So to begin it is 360/5 = 72
  float angleStep = 360/NumSegments;
  noStroke();
  //We use the mode TRIANGLE_FAN to segment our shape
  beginShape(TRIANGLE_FAN);
  
  //The first vertex point is in the middle of our canvas
  vertex(width/2, height/2);

  //Loop based on the value of the angleStep
  for (int i=0; i<=360; i+=angleStep) {
    //Fill colour is also calculated via angleStep hence number of segments
    fill(i, 255, 255);

    //This is an algorithm which calculates the x & y pos
    //to draw our shape based on the number of segments we have.
    float x =  width/2 + cos(radians(i)) * radius;
    float y =  height/2 + sin(radians(i)) * radius; 
    vertex(x, y);
  } 
  endShape();
}

/////////////////////////// FUNCTIONS ////////////////////////////

