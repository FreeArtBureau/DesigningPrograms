

/*
PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////
// Freez motion by pressing 'f'
boolean STOPANIME = false;

Letter A, B, C, D;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(600, 800);
  background(255);
  smooth();
  // constructor takes the following args :
  // Letter(this, char, x, y, nmbPnts, fontsize);
  A = new Letter(this, "B", 150, 100, 10, 130);
  B = new Letter(this, "B", 250, 100, 10, 130);
  C = new Letter(this, "B", 350, 100, 1, 130);
  D = new Letter(this, "B", 450, 100, 1, 130);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  //background(255);

  noStroke();
  fill(0,0,255, 10);
  // FIRST LETTER
  A.display();
  A.linearMotion(0, 1);  
  // Methods xAxisWaves, yAxisWaves have the following args :
  // (spin, angleFact, frequency, amplitude)
  // spin is a boolean TRUE / FALSE
  A.xAxisWaves(false, 1, 0.01, 15 );

  // SECOND LETTER 
  fill(0,255,255, 10);
  B.display();
  B.linearMotion(0, 1);  
  B.xAxisWaves(false, 1, 0.05, 15 );

  // THIRD LETTER 
   fill(255,0,255, 10);
  C.display();
  C.linearMotion(0, 1);  
  C.xAxisWaves(false, 1, 0.01, 15 );

  // FOURTH LETTER 
   fill(255,255,0, 10);
  D.display();
  D.linearMotion(0, 1);  
  D.xAxisWaves(false, 1, 0.05, 15 );
}

//////////////////////////////////////////////

void keyPressed() {
  if (key == 'f')
    STOPANIME = !STOPANIME;
  if (STOPANIME) {
    noLoop();
  } 
  else {
    loop();
  }

  if (key == 'q') {
    setup();
  }
  
  if(key == 's') {
   saveFrame("FrameSaved_###.png"); 
  }

  /////////////////////// PDF EXPORT

  if (key == 'r') {
    beginRecord(PDF, "EXPORT_###.pdf");
    println("Beginning PDF Export");
  }

  if (key == 'e') {
    endRecord();
    saveFrame("FrameSaved_###.png");
    println("PDF Export Finito !");
  }
}

