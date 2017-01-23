/*
Particle Class using PVectors
 
*/

class Particle {

  PVector pos;
  PVector vel;
  float dia;

  Particle() {
    pos = new PVector(random(width), random(height)); 
    vel = new PVector(random(-velocity,velocity),random(-velocity, velocity));
    dia = random(3, 40);
  }

  // ONE MAIN FUNCTION THAT CONTAINS ALL THE BELOW METHODS
  void render() {
    display();
    move();
    check();
  }

  // PARTICLE IS A SIMPLE ELLIPSE
  void display() {
    noStroke();
    fill(0, 0, 255, 150);
    ellipse(pos.x, pos.y, dia, dia);
  }

  // MOVING THE PARTICLE
  void move() {
    pos.add(vel);
    vel.limit(7); // Limit our acceleration to 5.
  }

  // CHECKING THE POSITION OF THE PARTICLE
  void check() {
    if (pos.x - dia/2 <= 0 || pos.x + dia/2 >=width)
      vel.x = -vel.x;
    if (pos.y - dia/2 <= 0 || pos.y + dia/2 >=height)
      vel.y = -vel.y;
  }

  // DRAWING THE CONNECTIONS WITH A LINE
  void drawConnection(Particle b, float d) {
    stroke(0,0,map(d, 10, 50, 0, 255));
    strokeWeight(0.3);
     //stroke(0,73);
     
    // Draw line from one particle to another
    line(pos.x, pos.y, b.pos.x, b.pos.y);
  }

  // Function for calculating distance between one particle and another
  float distance(Particle b) {
    return dist(pos.x, pos.y, b.pos.x, b.pos.y);
  }
}

