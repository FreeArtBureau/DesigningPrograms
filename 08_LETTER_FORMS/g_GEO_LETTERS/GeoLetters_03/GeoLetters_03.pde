/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////
import processing.pdf.*;

// Freez motion by pressing 'f'
boolean STOPANIME = false;
int PDF_TIMER;
boolean TIMER = false;

Letter A, B, C, D;
String s = "A";

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(650, 800);
  background(255);
  smooth();
  // constructor takes the following args :
  // Letter(this, char, x, y, nmbPnts, fontsize);
  A = new Letter(this, s, 100, 100, 1, 130);
  B = new Letter(this, "B", 250, 100, 1, 130);
  C = new Letter(this, "C", 400, 100, 1, 130);
  D = new Letter(this, s, 550, 100, 1, 130);
  
  // TIMED PDF EXPORT - After a certain amount of frames PDF is exported
  // This enables coherent images if exporting variations of a movement.
  if (TIMER ) {
    PDF_TIMER = 0;
    beginRecord(PDF, "EXPORT_"+s+".pdf");
    println("Beginning PDF Export");
  }
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  //background(255);

  noStroke();
  fill(0, 0, 255, 10);
  
  // FIRST LETTER
  A.display();
  A.linearMotion(0, 2);  
  // Methods xAxisWaves, yAxisWaves have the following args :
  // (spin, direction, angleFact, frequency, amplitude)
  // spin is a boolean TRUE / FALSE
  A.xAxisWaves(false, 1, 3, 0.01, 15 );

  // SECOND LETTER 
  B.display();
  B.linearMotion(0, 2);  
  B.xAxisWaves(true, 1, 3, 0.01, 15 );

  // THIRD LETTER 
  C.display();
  C.linearMotion(0, 2);  
  C.xAxisWaves(false, 1, 3, 0.01, 40 );

  // FOURTH LETTER 
  D.display();
  D.linearMotion(0, 2);  
  D.xAxisWaves(false, 1, 3, 0.15, 15 );


  // UPDATE TIMER & END RECORD 
  if (TIMER ) {
    PDF_TIMER++; 
    println( PDF_TIMER );
    if ( PDF_TIMER >= 100) {
      endRecord();
      saveFrame("FrameSaved_"+s+".png"); 
      println("PDF Export Finito !");
      PDF_TIMER = 0;
    }
  }
}

//////////////////////////////////////////////

