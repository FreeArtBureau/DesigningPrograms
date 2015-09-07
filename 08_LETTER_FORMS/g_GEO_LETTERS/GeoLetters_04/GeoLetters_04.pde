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

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(600, 800);
  background(255);
  smooth();
  // constructor takes the following args :
  // Letter(this, char, x, y, nmbPnts, fontsize);
  A = new Letter(this, "A", 150, 300, 1, 230);
  B = new Letter(this, "K", 350, 300, 5, 230);
  C = new Letter(this, "G", 450, 300, 5, 230);
  
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
  fill(0, 0, 255, 15);
  // linear motion method
  A.linearMotion(0, 1.3);
   
  // Perlin Points method 
  float na = map(mouseX, 0, width, 0.001, 0.010);
  float ns = map(mouseY, 0, height, 1, 500);
  //A.perlinPoints(na, ns, 0.7);

  // hard coding diameter 
  //A.dia = sin(frameCount*0.005) * 3; 
  
  // Methods xAxisWaves, yAxisWaves have the following args :
  // (spin, direction, angleFact, frequency, amplitude)
  // spin is a boolean TRUE / FALSE & direction is -1 or 1
  // angleFact is an int that takes values from 1-10
  
  A.xAxisWaves(false, -1, 5, 0.035, 30 );
  // finally the display method
  A.display();
  
  // Second Letter 
  B.linearMotion(0, 1.0);
  B.xAxisWaves(false, 1, 1, 0.05, 25);
  B.display();
  
  //C.polygonize();
  C.display();
  
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
