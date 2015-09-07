class FontAgent {

  PVector loc;
  PVector vel;
  int dia;
  int life = 255;

  FontAgent(float x, float y) {
    //Play with these values to get different motoin results.
    vel = new PVector(0, random(0.1));  
    loc = new PVector(x, y);
    dia = 1;
  }

  void render() {
 
    fill(255,255,23, life);
    noStroke(); 
    ellipse(loc.x, loc.y, dia, dia);
    life -=1;
  }


  void update() {
    loc.add(vel);
  }

}

