/*
Visualising Points on a Character.
 Move mouse to run through points.

Points_Viz_02
Same but implemented using a class Particle
and key input.

**Problem : We want each letter to be a seperate shape !

*/


import geomerative.*;
RShape shp;
RPoint[] pnts;
RFont f;
int pointStart;
Particle[] particles;
String letter;

void setup() {
  size(640, 300);
  smooth(); 
  fill(0, 0, 255);
  noStroke();
  RG.init(this);
  f = new RFont("Lekton-Bold.ttf", 300, CENTER);
   letter = "TYPE";
   
  int seg = 5;
  RCommand.setSegmentLength(seg);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  shp = f.toShape(letter);
  pnts = shp.getPoints();

  pointStart = 0;
  println("Total points = "+pnts.length);
  
  particles = new Particle[pnts.length];
  for(int i= 0; i<pnts.length; i++) {
   particles[i] = new Particle(pnts[i].x, pnts[i].y); 
  }
}
void draw() {
  background(255);
  translate(width/2, height/1.2);
  
  //NOTE - We go through all the points in the text here.
  pointStart = (int)map(mouseX, 0, width, 0, pnts.length);
  for (int i = pointStart; i < pnts.length ; i++) { 
    particles[i].render();
  }
}

void mousePressed() {
  for (int i = pointStart; i < pnts.length ; i++) { 
    ellipse(pnts[i].x, pnts[i].y, 5, 5);
  }
  println("We are at point = " + pointStart);
  println("There are "+abs(pointStart - pnts.length)+ " points left !");
}

//////////////////// KEY INPUT
void keyPressed() {
  if (key != CODED) {
    switch(key) {
      // case '1':
    case DELETE:
    case BACKSPACE:
      letter = letter.substring(0, max(0, letter.length()-1));
      break;
    case TAB:    
    case ENTER:
    case RETURN:
    case ESC:
      break;
    default:
      letter += key;
      println("Letter = "+key+" Points = " + pnts.length);
    }
  }
  //Update our letter and add particles.
   shp = f.toShape(letter);
  pnts = shp.getPoints();
   for(int i= 0; i<pnts.length; i++) {
   particles[i] = new Particle(pnts[i].x, pnts[i].y); 
  }
} 
  
