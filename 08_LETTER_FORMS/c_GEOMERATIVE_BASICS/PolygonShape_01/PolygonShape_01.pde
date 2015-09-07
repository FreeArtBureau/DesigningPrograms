/*
Converting text to a polygon shape
 with geomerative.
 Note that RShape
 
 */

/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;
RFont f;
RShape s;
RShape polyshp;
RPoint[] points;

//////////////////////////////////////////////
void setup() {
  size(800, 360); 
  RG.init(this);
  noStroke();
  f = new RFont("Lekton-Bold.ttf", 173);
  s = f.toShape("HELLO");
  points = s.getPoints();
  for (int i=0; i<points.length; i++) {
    println("(" +points[i].x + ", " + points[i].y +")");
  }
}

//////////////////////////////////////////////
void draw() {
  background(255);
  translate(width/5, height/2);
  float seg = map(mouseX, 0, width, 0, 100);
  RCommand.setSegmentLength(seg);
  polyshp = RG.polygonize(s);
  fill(0, 0, 255);
  RG.shape(polyshp); 

  RPoint[] points = s.getPoints();
  println(points);
}

