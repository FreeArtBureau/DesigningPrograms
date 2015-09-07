/*
Class FontAgent pour dessiner des formes simples et avoir 
des comportements uniques à chaque forme.
*/



class FontAgent {

  PVector loc;
  PVector vel;

  float dia;
  float offX;
  float xRand;
  float lifespan = 255;

  FontAgent(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector (0.1, 0);
    dia = 1;
  }

  void display() {
    noFill();
    //fill(lifespan);
    stroke(255,255,23, 53);
     dia = map(mouseX, 0, width, 1, 50);
    ellipse(loc.x, loc.y, dia, dia);
  }
}

