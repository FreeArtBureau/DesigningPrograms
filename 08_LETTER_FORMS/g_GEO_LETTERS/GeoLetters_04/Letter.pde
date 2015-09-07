
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
  RShape s;
  RShape polyshp;
  RPoint[] myPoints;
  int seg;

  String letter;// stored as String as Geomerative doesn't store chars
  int fontSize;

  PVector[] loc;
  PVector vel, acc;
  float accel;
  float dia;

  // MOTION VARS
  float x, y;
  float xDiff, yDiff;
  float angle;
  int dir;


  /* CONSTRUCTOR
   * @param applet calls parent applet to initialise Geomerative
   * @param letter  The letter to display
   * @param xPos, yPos  The x&y positions for letter
   * @param segmentLength  Number of points to display for letter
   * @param fontSize  The font size
   *
   */
  Letter(PApplet applet_, String letter, float xPos, float yPos, int segmentLength, int fontSize) {
    this.applet = applet_;
    RG.init(applet); 

    this.x = xPos;
    this.y = yPos;
    angle = 0;
    xDiff = 0;
    yDiff = 0;
    this.fontSize = fontSize;
    this.letter = letter;
    this.seg = segmentLength;
    dia = 1;

    // setup font
    font = new RFont("saxmono.ttf", fontSize, CENTER);
    RCommand.setSegmentLength( segmentLength );
    //RGroup myGroup = font.toGroup( letter ); 
    s = font.toShape( letter );
    myPoints = s.getPoints(); 
    //myPoints = myGroup.getPoints();

    // NB ALWAYS REMEMBER TO INITIALISE OUR PVECTOR LOC WITH 
    // THE ARRAY LENGTH EQUAL TO THE NUMBER OF POINTS !!!!
    loc = new PVector[myPoints.length];
    for (int i=0; i<myPoints.length; i++) {
      loc[i] = new PVector(myPoints[i].x, myPoints[i].y);
    }

    vel = new PVector(0, 0);
    accel = 0.0;
    acc = new PVector(accel, accel);
  }

  ////////////////////////////////////////////////////////////// METHODS

  /* DISPLAY METHOD 
   * displays each point for the letter
   */
  void display() {
    //polygonize();
    pushMatrix();
    translate(x+xDiff, y+yDiff);
    rotate( angle * dir);

    for (int i=0; i<myPoints.length; i++) { 
      pushMatrix();
      translate(loc[i].x, loc[i].y);
      ellipse(0, 0, dia, dia);
      popMatrix();
    }
    popMatrix();
  }

  /* LINEAR MOTION - ANIMATION METHOD 
   * animates the whole letter
   * @param xFact Multiplication factor for x axis
   * @param yFact Multiplication factor for y axis
   */
  void linearMotion(float xFact, float yFact ) {
    // remember this is the x & y position in relation to the letter & not the points
    // that we are modifying and adding to the translate() function in display
    xDiff += 0.3*xFact;
    yDiff += 0.3*yFact;
  }

  /* PERLIN POINTS - ANIMATION METHOD 
   * animates each point on letter
   * @param noiseAmm Amount of noise
   * @param noiseScale Scale of noise
   * @param nfactor  General overall noise factor
   */
  void perlinPoints(float noiseAmm, float noiseScale, float nfactor) {
    for (int i=0; i<myPoints.length; i++) {    
      float offX = noise(frameCount+(loc[i].x * noiseAmm), frameCount+(loc[i].y * noiseAmm)) * noiseScale;
      loc[i].x += cos(offX) * nfactor;
      loc[i].y += sin(offX) * nfactor;
    }
  }


  //////////////////////////////////////////////////////////////

  /* ANIMATION METHOD 
   *  xAxisWaves animates the whole letter with a wave like behavior (oscillation of axis) 
   * @param spin true/false for turning on/off rotation
   * @param direction -1/+1 for anticlock/clockwise rotation
   * @param angleFact Multiplication factor for angle/rotation
   * @param freq Frequency of wave oscillation
   * @param amp Amplitude of wave oscillation
   */
  void xAxisWaves(boolean spin, int direction, int angleFact, float freq, float amp) {
    this.dir = direction;
    xDiff = cos(frameCount * freq) * amp;
    if (spin) {
      angle += angleFact*0.0015;
    }
  }

  /* ANIMATION METHOD 
   *  yAxisWaves animates the whole letter with a wave like behavior (oscillation of axis)
   * @param spin true/false for turning on/off rotation
   * @param direction -1/+1 for anticlock/clockwise rotation 
   * @param angleFact Multiplication factor for angle/rotation
   * @param freq Frequency of wave oscillation
   * @param amp Amplitude of wave oscillation
   */
  void yAxisWaves(boolean spin, int direction, int angleFact, float freq, float amp) {
   this.dir = direction;
    yDiff = sin(frameCount * freq) * amp;
    if (spin) {
      angle += angleFact*0.0015;
    }
  }

  /* GENERAL UPDATE METHOD (not implemented yet)
   * used for updating all vectors
   */
  void update() {
    for (int i=0; i<myPoints.length; i++) {    
      vel.add(acc);
      loc[i].add(vel);
    }
    acc.limit(1);
    acc.mult(0);
  }


  ////////////////////////////////////////////////////////////// WIP TESTING
  void test01(int pnt) {

    for (int i=0; i<myPoints.length; i++) {    
      float offX = frameCount * (loc[i].x + loc[i].y);
      loc[i].x += sin(offX)*0.05;
    }
  }

  void test( float velocityX, float velocityY ) {
    vel = new PVector(velocityX, velocityY);

    for (int i=0; i<myPoints.length; i++) {    
      loc[i].add(vel);
    }
  }
  
  // not working !
  void polygonize() {
    RCommand.setSegmentLength(seg);
    polyshp = RG.polygonize(s);
    fill(0,0,255);
    RG.shape(polyshp);
    //RPoint[] 
    
  }
  
  
}

