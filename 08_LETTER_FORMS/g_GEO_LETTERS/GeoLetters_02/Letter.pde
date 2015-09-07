
import geomerative.*;
/*
REMEMBER THAT EACH POINT OF THE LETTER IS A PVECTOR
YET WE ALSO NEED X, Y POSITIONS TO PLACE EACH LETTER 
IN SPACE !
 */

class Letter {
  // programme parent
  PApplet applet;
  RFont font;
  RPoint[] myPoints;

  String letter;// stored as String as Geomerative doesn't store chars
  int fontSize;
  
  PVector[] loc;
  PVector vel;
  float dia;

  // MOTION VARS
  float x, y;
  float xDiff, yDiff;
  float angle;


  // CONSTRUCTOR
  Letter(PApplet applet_, String letter, float xPos, float yPos, float segmentLength, int fontSize) {
    this.applet = applet_;
    RG.init(applet); 

    this.x = xPos;
    this.y = yPos;
    angle = 0;
    xDiff = 0;
    yDiff = 0;
    this.fontSize = fontSize;
    this.letter = letter;
    
    dia = 1;
    
    // setup font
    font = new RFont("saxmono.ttf", fontSize, CENTER);
    RCommand.setSegmentLength( segmentLength );
    RGroup myGroup = font.toGroup( letter );  
    myPoints = myGroup.getPoints();

    // Initialiser nos vecteurs
    // NB ALWAYS REMEMBER TO INITIALISE OUR PVECTOR LOC WITH 
    // THE ARRAY LENGTH EQUAL TO THE NUMBER OF POINTS !!!!
    loc = new PVector[myPoints.length];
    for (int i=0; i<myPoints.length;i++) {
      loc[i] = new PVector(myPoints[i].x, myPoints[i].y);
    }

    vel = new PVector(0, 0);
  }


  void display() {
    pushMatrix();
    translate(x+xDiff, y+yDiff);
    rotate( angle );

    for (int i=0; i<myPoints.length; i++) { 
      pushMatrix();
      translate(loc[i].x, loc[i].y);
      ellipse(0, 0, dia, dia);
      popMatrix();
    }
    popMatrix();
  }

  void linearMotion(float xFact, float yFact ) {
    // remember this is the x & y position in relation to the letter & not the points
   // that we are modifying and adding to the translate() function in contructor
    xDiff += 0.3*xFact;
    yDiff += 0.3*yFact;
  }

   void xAxisWaves(int angleFact, float freq, float amp) {
    xDiff = sin(frameCount * freq) * amp;
    angle += angleFact*0.0015;
  }
  
  void yAxisWaves(int angleFact, float freq, float amp) {
    yDiff = cos(frameCount * freq) * amp;
    angle += angleFact*0.0015;
  }
  








////////////////////////////////////////////////////////////// WIP 20/12/14
  void anime11( float velocityX, float velocityY ) {
    vel = new PVector(velocityX, velocityY);

    for (int i=0; i<myPoints.length; i++) {    
      loc[i].add(vel);
    }
  }
}

