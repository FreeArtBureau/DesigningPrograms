/*
TYPO MANAGER CODÉ PAR JULIEN GACHADOAT AKA V3GA 2012
 http://www.v3ga.net/blog2/ 
 ADAPTÉ PAR MWEBSTER
 
 */
import geomerative.*;

class TypoManager {

  PApplet applet;  //Parent program  
  RFont fonte;
  RPoint[] points;
  RShape forme;  
  String texte;

  // Array list for our points
  PVector[] listePoints;

  // Array list for our forms
  PVector[][] listePointsShape;

  // Constructor
  TypoManager(PApplet applet_, String fontName_, float segmentLength) {
    //If you do not want to initialise in setup then use this method below 
    this.applet = applet_;
    RG.init(applet);

    fonte = new RFont(fontName_, 200, RFont.CENTER);
    RCommand.setSegmentLength(segmentLength);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    texte = "A"; // Initialise text.

    forme= fonte.toShape(texte);
    points = forme.getPoints();

    //Assign our list of points to the number of points in the text
    listePoints = new PVector[points.length];
    for (int i=0;i<points.length;i++) {
      listePoints[i] = new PVector( points[i].x+width/2, points[i].y+height/2 );
    }

    //Create an array of points for our shape
    RPoint[][] pointsShape = forme.getPointsInPaths();
    // RPoint p, t;

    //Note the 2D Array here to save both the number of points
    //and our PVectors. In this way we always keep track of
    //the number Pvectors in line with the number of points !
    listePointsShape = new PVector[pointsShape.length][];
    for (int i=0;i<pointsShape.length;i++)
    {
      //Assign our list of points for our shape
      listePointsShape[i] = new PVector[pointsShape[i].length];
      for (int j=0;j<pointsShape[i].length;j++) {
        listePointsShape[i][j] = new PVector(pointsShape[i][j].x+width/2, pointsShape[i][j].y+height/2);
      }
    }
  }
  
void animate2() {
  for (int i = 0; i < listePoints.length; i++ ) {
    listePoints[i].x += random(-1,1);
    listePoints[i].y += random(-1,1);
  }
}

  void drawPoints() {
    for (int i=0;i<listePoints.length;i++) {
      
      ellipse(listePoints[i].x, listePoints[i].y, 5, 5);
    }
  }

  void drawShapes() {
    PVector p;
    int i, j;

    for (i=0; i<listePointsShape.length; i++) {
      //Note > fill function does not work properly !
      noFill();
      //fill(255,0,0);
      beginShape();

      for (j=0; j<listePointsShape[i].length; j++) {
        p = listePointsShape[i][j];

        vertex(p.x, p.y);
      }

      vertex(listePointsShape[i][0].x, listePointsShape[i][0].y);

      endShape();
    }
  }
  
   float distance(RPoint[] p) {
     //for (int i=0;i<points.length;i++) {
    return dist(points[0].x, points[0].y, p[100].x, p[100].y);
    // }
  }

  //////////////////// KEY INPUT
  void updateLetters() {
    // if(keyPressed) {
    if (key != CODED) {
      switch(key) {
        // case '1':
      case DELETE:
      case BACKSPACE:
        texte = texte.substring(0, max(0, texte.length()-1));
        break;
      case TAB:    
      case ENTER:
      case RETURN:
      case ESC:
        break;
      default:
        texte += key;
        //println("Letter = "+key+" Points = " + listePointsShape.length);
      }
    }
    //Update our letter and add particles.
    if (texte.length() > 0) {
      forme= fonte.toShape(texte);
      RPoint[] points = forme.getPoints();

      listePoints = new PVector[points.length];

      for (int i=0;i<points.length;i++) {
        listePoints[i] = new PVector( points[i].x+width/2, points[i].y+height/2 );
      }

      RPoint[][] pointsShape = forme.getPointsInPaths();
      listePointsShape = new PVector[pointsShape.length][];
      for (int i=0;i<pointsShape.length;i++)
      {
        listePointsShape[i] = new PVector[pointsShape[i].length];
        for (int j=0;j<pointsShape[i].length;j++) {
          listePointsShape[i][j] = new PVector(pointsShape[i][j].x+width/2, pointsShape[i][j].y+height/2);
        }
      }
    }
  }
}

