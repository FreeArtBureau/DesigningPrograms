/*
 :::::::::::::::::
 MOTION ALGORITHMS 
 :::::::::::::::::
 Sketch : POINTGRID_01
 
 Smooth noise algo_00 implemented
 NB 29.01.2016
 NOTES :
 */
 
/////////////////////////// GLOBALS ////////////////////////////
import processing.opengl.*;
import peasy.*;
PeasyCam CAM;
PointGrid PG;
/////////////////////////// SETUP ///////////////////////////  /

void setup() {
  size(800, 500, OPENGL);
  background(0);
  smooth();
  PG = new PointGrid(14,8,50);
  CAM = new PeasyCam(this,500);
}


/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  translate(width/2, height/2);

  PG.render(true);

//println("fps : "+frameRate);
}
