/*
PLEASE READ INFO TAB
 */

/////////////////////////// GLOBALS ////////////////////////////
// Freez motion by pressing 'f'
boolean STOPANIME = false;

// Here we declare 2 Letter class objects
// Look at the Letter class
Letter A;
Letter B;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(600, 800);
  background(255);
  smooth();
  // constructor takes the following args :
  // Letter(this, char, x, y, nmbPnts, fontsize);
  A = new Letter(this, "A", 150, 200, 5, 230);
  B = new Letter(this, "B", 350, 200, 10, 230);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  //background(255);

  noStroke();
  fill(0, 0, 255,33);
  // FIRST LETTER
  A.display();
  A.linearMotion(0,1); 
  //A.dia = sin(frameCount*0.005) * 30; 
  // Methods xAxisWaves, yAxisWaves have the following args :
  // (angleFact, frequency, amplitude)
  // angleFact is an int that takes values from 1 > 10
  A.xAxisWaves( 5, 0.0035, 70 );
  
  // SECOND LETTER 
 fill(255, 0, 0,33);
  B.display();
  B.linearMotion(0,1);  
  B.xAxisWaves( 1, 0.0045, 70 );
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
}

