/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */
/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
ControlP5 interfaces;

float strokeW, len, angle;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(255);
  smooth();
  interfaces = new ControlP5(this);  
   interfaces.addSlider("len")
    .setPosition(10, 20)
      .setSize(150, 15)
        .setRange(0, 100)
          .setValue(20.0);
    
   interfaces.addSlider("strokeW")
      .setPosition(10, 40).setSize(150, 15).setValue(10).setRange(0, 100);
   interfaces.addSlider("angle")
      .setPosition(10, 60).setSize(150, 15).setRange(0, 360);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0, 0, 33);
  stroke(255, 173);
  strokeWeight(strokeW);
  
  for (int y=100; y<height-50; y+=75) {
    for (int x=90; x<width-50; x+=75) {
      
      cross(x, y, len, angle);
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////

void cross(float _x, float _y, float _len, float _angle) {
  pushMatrix();
  translate(_x, _y);
  rotate(radians(_angle));     
  line(-_len, -_len, _len, _len);
  popMatrix();
  pushMatrix();
  translate(_x, _y);
  rotate(radians(-_angle));
  line(-_len, _len, _len, -_len);
  popMatrix();
}