/*
PLEASE READ INFO
*/

/////////////////////////// GLOBALS ////////////////////////////
import geomerative.*;
import processing.pdf.*;
boolean doSave = false;

RFont font;
RPoint[] pnts; 
String myText = "TYPE...";
RGroup grp;

FontAgent[] vec;
//////////////////////////////////////////////
void setup() {
  size(800, 400);
  background(255);
  smooth();
  RG.init(this); 
  font = new RFont("AnonymousPro-Bold.ttf", 173, CENTER);
  RCommand.setSegmentLength(2);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  grp = font.toGroup(myText);
  pnts = grp.getPoints();
  vec = new FontAgent[pnts.length];

  for (int i=0; i<pnts.length; i++) {
    vec[i] = new FontAgent(pnts[i].x, pnts[i].y);
  }
}

//////////////////////////////////////////////
void draw() {
  if (doSave) beginRecord(PDF, "PDF_Export_###.pdf");
  background(27);
  translate(width/2, height/1.7);


  if (myText.length() > 0) {
 RCommand.setSegmentLength(2);
    RGroup grp = font.toGroup(myText); 
    grp = grp.toPolygonGroup();
    RPoint[] pnts = grp.getPoints();
    
    vec = new FontAgent[pnts.length];
    for (int i=0; i<pnts.length; i++) {
      vec[i] = new FontAgent(pnts[i].x, pnts[i].y);
    } 
    for (int i=0; i<pnts.length; i++) {
      vec[i].display();
    }

    // ------ SAVING  ------ 
    if (doSave) {
      doSave = false;
      endRecord();
      saveFrame("PNG_Export_###.png");
      println("Enregistré !");
    }
  }
}
//////////////////////////////////////////////
//--------------------------------------------------------------------------
void keyReleased() {
  if (keyCode == CONTROL) doSave = true;
}
//--------------------------------------------------------------------------
//VOICI LE BLOC DE CODE POUR UTILISER LE CLAVIER
void keyPressed() {
  if (key != CODED) {
    switch(key) {
      // case '1':
    case DELETE:
    case BACKSPACE:
      myText = myText.substring(0, max(0, myText.length()-1));
      break;
    case TAB:    
    case ENTER:
    case RETURN:
    case ESC:
      break;
    default:
      myText += key;
    }
  }
   
}




