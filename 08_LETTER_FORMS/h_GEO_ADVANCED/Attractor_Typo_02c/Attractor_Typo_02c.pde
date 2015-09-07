
////////////////////////////////////
/*
PLEASE READ INFO TAB
*/

////////////////////////// GLOBALS //////////////////////////////

import geomerative.*;
import processing.pdf.*;
boolean recordPDF = false;
boolean stop = false;
float strength = 133.1;

// VOICI DES PARAMS IMPORTANT
float noiseScale = 100.00;
float noiseStrength = 30.50;

// these two are important var from making big visual changes
float damp = 0.713;
float nodeMov = 1.3;// IMPORTANT ! Makes node move

int nodeCount = 1000;

//RIEN À FAIRE ICI
int transY = 300;
int transX = 50;

Node[] myNodes;
Attractor[] myAttractor;

RFont a;
RPoint[] myPoints;
RShape shp;
String s;
int pnts; 

//VOICI UNE LISTE DE COULEURS / PALETTE
color[] myColour = {
  //#FFFFFF,#000000,#000000,#000000,#FFFFFF
  #FFFFFF, #CB3333, #FF121A, #FAFF12, #3392CB, #FF890A, #FFFFFF
};

////////////////////////// SETUP //////////////////////////////

void setup() {
  size(1100, 460);
  smooth();
  background(255);
  noFill();
  RG.init(this);
  initSystem();
}

////////////////////////// DRAW //////////////////////////////
void draw() {
  //background(0);
  translate(100, height/1.4);
  for (int i=0; i<myNodes.length; i++) {
    myNodes[i].draw();
    myNodes[i].update();
  }

  //ON PLACE UNE SEULE ATTRACTOR À LA FIN DE CHAQUE LETTRE
  //pnts-1, c'est l'avant dernier point sur notre forme / lettre.
  //Si tu mets la valeur '0', on place des attracteurs sur chaque point de la forme.
  for (int i=0; i<myPoints.length; i++) {
   // for (int k=0; k<myNodes.length; k++) {
      //On peut faire l'attraction sur des noeuds
      myAttractor[i].attract(myNodes[i]);
    }
 // }
}


////////////////////////// KEY FUNCTIONS //////////////////////////////

void keyPressed() {
  
  if(keyCode == RIGHT) {
   saveFrame("screenShot_###.png"); 
  }
  //if (key != CODED) {
  switch(key) {
    // case '1':
  case DELETE:
  case BACKSPACE:
    s = s.substring(0, max(0, s.length()-1));
    //background(0);
    break;
  case TAB:    
  case ENTER:
  case RETURN:
  case ESC:
    break;
  default:
    s += key;

    //UTILISER ALT KEY OU AUTRE POUR ARRETER L'ANIMATION
    if (keyCode == ALT) {
      stop = !stop; 
      if (stop == true) {
        noLoop();
      }
      else loop();
    }
  }
  updateSystem();
}


