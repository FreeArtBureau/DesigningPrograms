///////////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 SYSTÈMES GRAPHIQUES 1.0
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 
 www.freeartbureau.org
 ++++++++++++++++++++++++++++++++++++++++++
 LES BASES : 
 SKETCH : STICK_ROTATE
 PARENT SKETCH : NONE
 TYPE : DYNAMIQUE
 */

/////////////////////////// GLOBALS //////////////////////////// 

float angle;
/////////////////////////// SETUP ////////////////////////////
void setup() {  
  size (800, 400); 
  background (255);
  smooth();
  angle = radians(0);
}

/////////////////////////// DRAW ////////////////////////////  
void draw() {

  if (mousePressed == true) {  
    float th = random(0.2, 8.0); // thickness
    float ss = random(0, 24); //size

    translate(mouseX, mouseY); 
    angle += 0.1;
    // Try this line too ;–)
    //angle = sin(frameCount*0.035) * 6;
    rotate(angle);
    stick(0, 0, th, ss);
  }
}


/////////////////////////// FUNCTIONS ////////////////////////////

// Notre fonction de dessin (2 lignes superposées) 
void stick(float x, float y, float thickness, float sizes) {    
  stroke(0);
  strokeWeight(thickness);
  line (x-sizes, y-sizes, x+sizes, y+sizes);
  stroke(255);
  strokeWeight(2);
  line (x-sizes, y-sizes, x+sizes, y+sizes);
}


//--------------------------------------------------------------------------
//FILE EXPORT & KEY CONTROLS

void keyReleased() { 

  if (key == DELETE || key == BACKSPACE) background(255);
  if (key == 's' || key == 'S') saveFrame("monImage_###.png");
}

