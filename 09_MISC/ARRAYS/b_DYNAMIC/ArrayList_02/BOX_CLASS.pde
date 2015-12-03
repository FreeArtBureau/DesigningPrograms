////////////
class Box {
  float x, y;
  float w;
  color c;
  float angle;

  Box(int x, int y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    c = color(random(130), random(100), random(255));
    angle = radians(0);
  }

  void render() {
    fill(c, 33);
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rect(0, 0, w, w);
    popMatrix();
  }
  
  void move() {
  //y+=0.3;
  angle+=sin(angle*0.3)*50;
  angle+=0.5;
  }
}

