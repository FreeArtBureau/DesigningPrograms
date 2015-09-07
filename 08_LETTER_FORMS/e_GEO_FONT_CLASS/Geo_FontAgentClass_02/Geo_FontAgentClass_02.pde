/*
PLEASE READ INFO TAB
*/

/////////////////////////// GLOBALS ////////////////////////////

import geomerative.*;

RFont font;
RPoint[] myPoints;
RGroup myGroup;
String myText = "DISPLACE";

FontAgent[] myFontAgents;

float DISP_FACT = 0.73; // Use this var to change displacement factor
float PART_SIZE_MAX = 5; // maximum particle size

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(850, 300);
  background(0);
  smooth();
  
  RG.init(this); 
  font = new RFont("FreeSans.ttf", 160, CENTER);
  
  RCommand.setSegmentLength(2);
  myGroup = font.toGroup(myText); 
  myPoints = myGroup.getPoints();
 
 //  Initialisation des objets
  myFontAgents = new FontAgent[myPoints.length]; 
  
  for (int i=0; i<myPoints.length; i++) {
    myFontAgents[i] = new FontAgent(myPoints[i].x, myPoints[i].y);
  }
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0);
  translate(width/2, height/1.4); 
  
  //Afficher nos particles
  for (int i=0; i<myPoints.length; i++) {
    // méthode pour afficher les points
    myFontAgents[i].render();
    
    // différentes méthodes pour animer les points
    // Voir l'onglet Particle
    //myFontAgents[i].animate1();
    //myFontAgents[i].animate2();
    myFontAgents[i].animate3();
  
}
}

//////////////////////////////////////////////

