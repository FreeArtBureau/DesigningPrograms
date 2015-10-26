void setup() {
  size(400, 400);
  smooth();
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  translate(width/2, height/2);
  if (mousePressed) {
    ellipse(mouseX-width/2, mouseY-height/2, 5, 5);
    rotate(radians(180));
    ellipse(mouseX-width/2, mouseY-height/2, 5, 5);
  }
}

