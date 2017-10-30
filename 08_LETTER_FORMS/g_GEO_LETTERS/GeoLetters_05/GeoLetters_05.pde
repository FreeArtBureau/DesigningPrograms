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
Letter E;

float linearMotionY = 1.3;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(900, 640);
  background(0);
  smooth();
  // constructor takes the following args :
  // Letter(this, char, x, y, nmbPnts, fontsize);
  A = new Letter(this, "WEAVE", 440, -12, 5, 250);
  /*B = new Letter(this, "I", 310, 150, 25, 260);
  C = new Letter(this, "R", 520, 150, 25, 260);
  D = new Letter(this, "E", 705, 150, 25, 260);
  */
  //E = new Letter(this, "P", 705, 150, 25, 230);

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
  float freqCol = sin(frameCount*0.030) * 230;
  float freqCol2 = sin(frameCount*0.015) * 50;
  float freqCol3 = sin(frameCount*0.030) * 100;
  fill(25+freqCol, 150+freqCol3, 200+freqCol2, 45);
  //fill(130+freqCol, 85+freqCol, 10, freqCol);
  // linear motion method
  A.linearMotion(0, linearMotionY);

  // Perlin Points method
  float na = map(mouseX, 0, width, 0.001, 0.010);
  float ns = map(mouseY, 0, height, 1, 500);
  //A.perlinPoints(na, ns, 0.7);

  // Methods xAxisWaves, yAxisWaves have the following args :
  // (spin, direction, angleFact, frequency, amplitude)
  // spin is a boolean TRUE / FALSE & direction is -1 or 1
  // angleFact is an int that takes values from 1-10
  float freq = sin(pow(0.001, 0.15)) * 0.0130;
  //float freq = sin(frameCount * 0.005) * 0.015;
  A.dia = sin(frameCount*freq) * 1.7;
  A.xAxisWaves(false, 1, 1,1, .015, 30);
  //A.xOscillate(0.015, 0.37);
  // finally the display method
  A.display();
  /*
  // Second Letter
  B.linearMotion(0.0, linearMotionY);

  // hard coding diameter
  B.dia = sin(frameCount*freq) * 2.6;
  //B.xAxisWaves(false, 1, 1, 1, 0.015, 10);
  //B.xOscillate(0.001, 0.017);
  B.display();

  C.linearMotion(0, linearMotionY);
  C.dia = sin(frameCount*freq) * 2.6;
  //C.xAxisWaves(false, 1, 1, 1, 0.015, 10);
  //C.xOscillate(0.001, 0.017);
  C.display();
  //C.perlinPoints(sin(frameCount*0.1)*0.01, 7, 0.1);

  D.linearMotion(0, linearMotionY);
  D.dia = sin(frameCount*freq) * 2.6;
  //D.xAxisWaves(false, 1, 1, 1, 0.015, 10);
  //D.xOscillate(0.001, 0.017);
  D.display();
*/
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

  //saveFrame("FrameSaved_####.png");

}

//////////////////////////////////////////////
void mousePressed() {
  frameCount = 0;
  setup();
}
