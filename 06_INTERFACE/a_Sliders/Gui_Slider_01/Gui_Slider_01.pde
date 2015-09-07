/*

IMPORTANT :
Il faut importer la bibliothèque controlP5
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
ControlP5 interfaces;
int BGColour;
int RectCol;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  rectMode(CENTER);
  interfaces = new ControlP5(this);
  Slider s1 = interfaces.addSlider("BGColour")
    .setPosition(100,20)
      .setRange(0,255);
  
  Slider s2 = interfaces.addSlider("RectCol")
    .setPosition(100,40)
      .setRange(0,255)
        .setValue(155);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(BGColour);
  noStroke();
  fill(RectCol);
  rect(width/2,height/2,100,100);

}

/////////////////////////// FUNCTIONS ////////////////////////////

