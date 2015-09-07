class FontAgent {

  PVector loc, vel, acc;

  float accel;
  float dia;
  float mass;

  FontAgent(float x, float y, float m) {
    this.mass = m;

    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = 0.0;
    acc = new PVector(0, accel);
    dia = mass*0.03;
  }
  void drawVectors() {
    display();
    update();
    // check();
  }

  void update() {
    vel.add(acc);    
    loc.add(vel);
    acc.limit(1); // Limit our acceleration to 1.

    acc.mult(0); // We multiply acc by 0 to reset our object on each update
    // otherewise we accumulate calculations
  }

  void display() {
    fill(255, 255, 23, 53); 
    noStroke();
    ellipse(loc.x, loc.y, dia, dia);
  }

  /*
  Our force function
   */
  void applyForce(PVector force) {
    PVector f = force.get(); //with get we copy the object. it returns a PVector.
    f.div(mass); //We first divide force by mass.
    acc.add(f); //Then we add
  }


  void check() {
    if (loc.x > width-dia/2) {
      loc.x = width-dia/2;
      vel.x *= -1;
    } 
    if (loc.x < 0+dia/2) {
      loc.x = 0+dia/2;
      vel.x *= -1;
    } 

    if (loc.y > height-dia/2) {
      loc.y = height-dia/2;
      vel.y *= -1;
    } 
    if (loc.y < 0+dia/2) {
      loc.y = 0+dia/2;
      vel.y *= -1;
    }
  }
}

