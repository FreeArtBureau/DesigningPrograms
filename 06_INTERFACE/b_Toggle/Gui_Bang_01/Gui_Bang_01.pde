/*
----------------------------------------
 PLEASE READ INFO TAB FOR ALL INFORMATION
 ----------------------------------------
 */
/////////////////////////// GLOBALS ////////////////////////////
PrintWriter output; // Used to write data to file

import controlP5.*;
ControlP5 interfaces;

float strokeW = 1;
float lineLn ;
float angle;
boolean show;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(255);
  smooth();
  rectMode(CENTER);
  strokeCap(SQUARE);
  angle = radians(0);
  controlInit(); // custom function. See INTERFACES TAB
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  trameH();

  if (show) {
    trameV();
  }
}


