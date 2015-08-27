
void setup() {
  size(500, 300);
  smooth();
}

void draw() {
  background(255);
  
  int noiseRange = mouseX/10;
  
  beginShape();
  for (int x = 0; x<width; x+=10) {
    float noiseX = map(x, 0, width, 0, noiseRange);
    println(noiseX);
    
    // we use the mouseX var to control the amount of noise
    // which is calculated here to act on the y variable
    float y = noise(noiseX)*height;
    // Draw Line
    vertex(x, y);
    
    // Draw points
    pushStyle();
    fill(0, 0, 255);
    noStroke();
    ellipse(x, y, 5, 5);
    popStyle();
  }
  endShape();
}

