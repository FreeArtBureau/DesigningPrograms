
class FontAgent { 

  float x, y;
  float finalDia;

  FontAgent(float x, float y) {  
    this.x = x; 
    this.y = y; 
    // this.dia = dia;
  } 

  void display() {
    //noFill();
    if (contour == false) {
      noStroke();
      fill(255, 33);
    } else {
      strokeWeight(0.3);
      stroke(255);
      noFill();
    }
    //stroke(0); 
    ellipse(x, y, finalDia, finalDia);
  }

  void animate1() {

    float noiseScaler = 0.009;
    float z = frameCount*0.007;
    finalDia = noise(x * noiseScaler, y * noiseScaler, z)*53;
  }

  void animate2() {
    float offs = frameCount * 0.04 + (x + y) * 0.01;
    finalDia = sin(offs) * 13 + 23 * 1.2;
  } 

  void animate3() {
    float noiseScaler = 0.008; //if this number gets smaller the circles will look more similar in size
    float ang = frameCount * 0.01; //if this number gets bigger the movement will be more nervous... play around!
    float rad = width/2;
    float nx = (x + cos(ang) * rad) * noiseScaler;
    float ny = (y + sin(ang) * rad) * noiseScaler;
    finalDia = noise(nx, ny) * 33 + 10; //for more variation you could still add a z in noise...
  }

  void animate4() {
    float offs = (frameCount%500) * 0.09 + (x + y) * 0.02;
    finalDia = random(offs);
  }
}

