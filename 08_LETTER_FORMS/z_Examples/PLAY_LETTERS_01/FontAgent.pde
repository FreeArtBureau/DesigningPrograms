/*
Class FontAgent pour dessiner des formes simples et avoir 
 des comportements uniques à chaque forme.
 */



class FontAgent {

  PVector loc;
  PVector vel;

  float rectSize;
  float offX;
  float xRand;
  float angle;
  float lifespan = 255;

  FontAgent(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector (0.1, 0);
    rectSize = SHP_SIZE;
    angle = ANGLE_1;
  }

  void display() {
    noStroke();
    fill(0, 0, 255);
    rectMode(CENTER);
    //angle = map(mouseY, 0, height, 0, TWO_PI);
    //rectSize = map(mouseX, 0, width, 1, 50);

    pushMatrix();
    translate(loc.x, loc.y);
    rotate( -angle );

    if (CIRCLES) {
      for(int i=10; i>=0; i=i-2) {
        stroke(0,0,255);
        noFill();
      ellipse(0, 0, DIA/i, DIA/i);
      }
    } else {
      rect(0, 0, rectSize, rectSize);
    }

    popMatrix();
  }

  void display2() {
    noStroke();
    fill(255, 0, 0);
    rectMode(CENTER);
    //angle = map(mouseY, 0, height, 0, TWO_PI);
    //rectSize = map(mouseX, 0, width, 1, 50);

    pushMatrix();
    translate(loc.x, loc.y);
    rotate( angle );
    if (CIRCLES) {
     // ellipse(0, 0, DIA, DIA);
    } else {
      rect(0, 0, rectSize, rectSize);
    }
    popMatrix();
  }
}

