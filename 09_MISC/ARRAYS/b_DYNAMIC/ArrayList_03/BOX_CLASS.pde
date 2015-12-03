

////////////
class Box {
  float x, y;
  float w;
  color c;
  float angle;
  float theta;
  float step;

  Box(int x, int y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.step = 0.001;
    c = color(random(30, 173), random(100), random(50, 255));
    angle = radians(0);
    theta = radians(0);
  }

  void render(float _boxS) {
    fill(c, 33);
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rect(0, 0, w+_boxS, w+_boxS);
    popMatrix();
  }
  
  void move() {
    angle+=sin(theta * 0.05) * 3;
    theta+=0.1;
  }
  
  void move2(float nAMM) {
    float theta2 = noise(x*0.05)*nAMM;
    angle+=sin(theta2 * 0.05) * 3;
  }

}

