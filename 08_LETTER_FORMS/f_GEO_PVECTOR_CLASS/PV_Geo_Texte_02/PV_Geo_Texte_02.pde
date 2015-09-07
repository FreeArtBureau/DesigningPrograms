/*
PLEASE READ INFO TAB
 */
/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;
import processing.pdf.*;
boolean recordPDF = false;

////////////////////////// GLOBALS //////////////////////////////

RShape maForme;
RPoint[] pnts;
FontAgent[] myAgents;
float transX;
float transY;
////////////////////////// SET UP //////////////////////////////

void setup() {
  size(1200, 700);
  transX = width/2;
  transY = height/2;
  background(0);
  smooth();
  RG.init(this);
  maForme = RG.loadShape("text_01b.svg");
  maForme = RG.centerIn(maForme, g, 100);

  RCommand.setSegmentLength(2);
  pnts = maForme.getPoints();

  myAgents = new FontAgent[pnts.length];
  for (int i=0; i<pnts.length; i++) {
    myAgents[i] = new FontAgent(pnts[i].x, pnts[i].y);
  }
}

////////////////////////// DRAW //////////////////////////////

void draw() {
  // fill(0, 23);
  //rect(0, 0, width, height);
  if (recordPDF) beginRecord(PDF, "PDF_Export_###.pdf");
  background(0);
  translate(transX, transY);

  for (int i = 0; i < pnts.length; i++) {
    myAgents[i].display();
     myAgents[i].animate1();
     myAgents[i].animate2();
    // myAgents[i].animate3();
    // myAgents[i].animate4();
    
    //myAgents[i].interaction();
  }
  if (recordPDF) {
    recordPDF = !recordPDF;
    endRecord();
    println("FINITO !");
  }
}

void mousePressed() {
  setup();
}

void keyPressed() {
  if (key == 's')
    recordPDF = true;
}

