/*
PLEASE READ INFO TAB

****************
NOTES : 13.08.15
        - Convert String to Char ?
 */

/////////////////////////// GLOBALS ////////////////////////////
import processing.pdf.*;
int PDF_TIMER;
boolean TIMER = false; // turn on to activate PDF timer
int NUM_FRAMES = 100; // number of frames to record
String PDF_NUM = "A"; // change this for new exports (otherwise it overwrites)

// Freez motion by pressing 'f'
boolean STOPANIME = false;

Letter A;
Letter B;
Letter C;
Letter D;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(900, 640);
  background(0);
  smooth();
  // constructor takes the following args :
  // Letter(this, char, x, y, nmbPnts, fontsize);
  A = new Letter(this, "P", 150, 150, 5, 230);
  B = new Letter(this, "L", 330, 150, 15, 230);
  C = new Letter(this, "A", 530, 150, 5, 230);
  D = new Letter(this, "Y", 700, 150, 15, 230);

  // TIMED PDF EXPORT - After a certain amount of frames PDF is exported
  // This enables coherent images if exporting variations of a movement.
  if (TIMER ) {
    PDF_TIMER = 0;
    beginRecord(PDF, "EXPORT_"+PDF_NUM+".pdf");
    println("Beginning PDF Export");
  }
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  //background(255);

  // First letter
  noStroke();
  fill(255, 25);
  // linear motion method
  A.linearMotion(0, 1.7);

  // Perlin Points method
  float na = map(mouseX, 0, width, 0.001, 0.010);
  float ns = map(mouseY, 0, height, 1, 500);
  //A.perlinPoints(na, ns, 0.7);

  // Methods xAxisWaves, yAxisWaves have the following args :
  // (spin, direction, angleFact, frequency, amplitude)
  // spin is a boolean TRUE / FALSE & direction is -1 or 1
  // angleFact is an int that takes values from 1-10
  A.dia = sin(frameCount*0.005) * 2.6;
  A.xAxisWaves(false, 1, 1, 0.015, 25);
  // finally the display method
  A.display();

  // Second Letter
  B.linearMotion(0, 1.7);

  // hard coding diameter
  B.dia = sin(frameCount*0.005) * 2.6;
  B.xAxisWaves(false, 1, 1, 0.015, 25);
  B.display();

  C.linearMotion(0, 1.7);
  C.dia = sin(frameCount*0.005) * 2.6;
  C.xAxisWaves(false, 1, 1, 0.015, 25);
  C.display();
  //C.perlinPoints(sin(frameCount*0.1)*0.01, 7, 0.1);

  D.dia = sin(frameCount*0.005) * 2.6;
  D.xAxisWaves(false, 1, 1, 0.015, 25);
  D.linearMotion(0, 1.7);
  D.display();

  // UPDATE TIMER & END RECORD
  if (TIMER ) {
    PDF_TIMER++;
    println( PDF_TIMER );
    if ( PDF_TIMER >= NUM_FRAMES) {
      endRecord();
      saveFrame("FrameSaved_"+PDF_NUM+".png");
      println("PDF Export Finito !");
      PDF_TIMER = 0;
    }
  }

}

//////////////////////////////////////////////
void mousePressed() {
  frameCount = 0;
  setup();
}