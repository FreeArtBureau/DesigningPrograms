
Ball myBall;

void setup() {
  size(600,400);
  smooth();
  myBall = new Ball(0,200);
}

void draw() {
 background(0);
myBall.run(); 
}
