/*
DASHED CIRCLE
KYLE MCDONALD
*/

float radius = 50;
 
void setup() {
    size(200, 200);
    noFill();
    stroke(255);
    strokeWeight(5);
    smooth();
}
 
void draw() {
    background(0);
     
    translate(100, 100);
    dashedCircle(50, 6, 12);
}
 
void dashedCircle(float radius, int dashWidth, int dashSpacing) {
    int steps = 200;
    int dashPeriod = dashWidth + dashSpacing;
    boolean lastDashed = false;
    for(int i = 0; i < steps; i++) {
      boolean curDashed = (i % dashPeriod) < dashWidth;
      if(curDashed && !lastDashed) {
        beginShape();
      }
      if(!curDashed && lastDashed) {
        endShape();
      }
      if(curDashed) {
        float theta = map(i, 0, steps, 0, TWO_PI);
        vertex(cos(theta) * radius, sin(theta) * radius);
      }
      lastDashed = curDashed;
    }
    if(lastDashed) {
      endShape();
    }
}

