/*
PLEASE READ INFO
 */

/////////////////////////// GLOBALS ////////////////////////////
import controlP5.*;
import geomerative.*;
import processing.pdf.*;
boolean PDFEXPORTING = false;

ControlP5 INTERFACES;

RFont font;
RPoint[] pnts; 
String myText = "TYPE";
RGroup grp;
int spacing = 0;
FontAgent[] vec;
//////////////////////////////////////////////
void setup() {
  size(800, 600);
  background(255);
  smooth();
  controlInit(); // on initialise notre interface
  geomerativeInit();
}

//////////////////////////////////////////////
void draw() {
  pushMatrix();
  translate(0, 0);
  INTERFACES.draw();
  popMatrix();
  randomSeed(10000);
  if (PDFEXPORTING) beginRecord(PDF, "PDF_Export_###.pdf");
  background(255);

  stroke(255, 0, 0);
  noFill();
  pushMatrix();
  translate(width/2, height/1.3);


  if (myText.length() > 0) {
    font = new RFont("AnonymousPro-Bold.ttf", FONTSIZE, CENTER);
    RCommand.setSegmentLength(1);
    RGroup grp = font.toGroup(myText); 
    grp = grp.toPolygonGroup();
    RPoint[] pnts = grp.getPoints();


    vec = new FontAgent[pnts.length];
    for (int i=0; i<pnts.length; i++) {
      vec[i] = new FontAgent(pnts[i].x, pnts[i].y);
    } 
    for (int i=0; i<pnts.length; i++) {
      int rand = (int)random(7);

      spacing = i%PNTS;
      if (spacing == 0) {
        vec[i].display();

        //} else if ((spacing == 1) && (rand <= 5)) {
      } else if (spacing == PNTS_OFF) {

        vec[i].display2();
      }
    }

    // ------ SAVING  ------ 
    if (PDFEXPORTING) {
      PDFEXPORTING = false;
      endRecord();
      saveFrame("PNG_Export_###.png");
      println("Enregistré !");
    }
  }
  popMatrix();
}


