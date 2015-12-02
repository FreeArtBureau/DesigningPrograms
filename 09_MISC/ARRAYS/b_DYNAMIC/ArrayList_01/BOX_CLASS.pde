/////////////////////////// CLASS
class Box {
  float x, y;
  float w;
  color c;
  float angle;

  Box(int x, int y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    c = color(255);
    angle = radians(0);
  }

  void render() {
    fill(c, 150);
    noStroke();
    pushMatrix();
    translate(x,y);
    rotate(angle);
    rect(0, 0, w, w);
    popMatrix();
  
  }
  
  void move() {
    y+=0.3;
    //angle+=sin(angle*0.03)*50;
    angle+=0.05;
  }
}

