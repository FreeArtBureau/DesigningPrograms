/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
*/

////////////////////////// GLOBALS ///////////////////////////

float angleStep = 90;
Motif myMotif; 

////////////////////////// SETUP ///////////////////////////
void setup() {
  size(400, 400);
  smooth();
  background(255);
  myMotif = new Motif(0, 0, 0.15);

}

////////////////////////// DRAW ///////////////////////////
void draw() {
  translate(width/2, height/2);
  
  for (float theta = 0; theta < 360; theta += angleStep) {
    myMotif.render();
    myMotif.move();
    rotate( radians(angleStep) );
  }
}

////////////////////////// CLASS ///////////////////////////
//We create a very simple class to draw our pattern.
class Motif {
  float x, y;
  float angle;
  float angleFactor;

  Motif(float x, float y, float angleFactor) {
    this.x = x;
    this.y = y;
    this.angleFactor = angleFactor;
  }

  void render() {
    stroke(0,0,255);
    point(x, y);
  }

  void move() {
    angle += random(-0.2, 0.2);
    x += cos(angle) * angleFactor;
    y += sin(angle) * angleFactor;
  }
  
   void move2() {
    float nX = noise(x*0.0096, y*0.0096) * 73;
    float nY = noise(x*0.0096, y*0.0096) * 73;
    //angle += noise(-nX,nX);

    x += cos(nX) * 0.139;
    y += sin(nY) * 0.139;
  }
}


void keyPressed() {
  if (key == 'q' || key == 'Q') setup();
}

