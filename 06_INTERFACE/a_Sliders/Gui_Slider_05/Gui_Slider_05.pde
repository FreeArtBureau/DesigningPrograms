/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */
/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
ControlP5 interfaces;

float strokeW = 1;
float lineLn ;
float angle;


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(255);
  smooth();
  rectMode(CENTER);
  strokeCap(SQUARE);
  angle = radians(0);
  interfaces = new ControlP5(this);  

 Slider s = interfaces.addSlider("lineLn").setPosition(10,20).setRange(0,100).setValue(20.0);;
 Slider r = interfaces.addSlider("strokeW").setPosition(10,40).setRange(0,100);
 Slider a = interfaces.addSlider("angle").setPosition(10, 60).setRange(0, TWO_PI);

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  trameH();
  trameV();
}

/////////////////////////// FUNCTIONS ////////////////////////////

void trameH() {
  for (int xPos=125; xPos<width-100; xPos+=50) {
    for (int yPos=125; yPos<height-100; yPos+=75) {
      fill(0);
      stroke(0);
      pushMatrix();
      translate(xPos, yPos);
      rotate(angle);     
      line(-lineLn, -lineLn, lineLn, lineLn);
      popMatrix();
    }
  }  
}

void trameV() {
   for (int xPos=125; xPos<width-100; xPos+=50) {
    for (int yPos=125; yPos<height-100; yPos+=75) {
      fill(0);
      stroke(0);
      strokeWeight(strokeW);
      pushMatrix();
      translate(xPos, yPos);
      rotate(HALF_PI);
      rotate(-angle);
     
      line(-lineLn, -lineLn, lineLn, lineLn);
      popMatrix();
    }
  }  
  
}

