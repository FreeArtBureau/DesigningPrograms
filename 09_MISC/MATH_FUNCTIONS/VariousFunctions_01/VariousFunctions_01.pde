/*
USE OF THE FOLLOWING FUNCTIONS :
frameRate()
millis()
modulo - %
noise()

Taken from 
http://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/

*/

float x, y, r, g, b, radius;
int timer;

void setup() {
  size(500, 500);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  // use frameCount to move x, use modulo to keep it within bounds
  x = frameCount % width;

  // use millis() and a timer to change the y every 2 seconds
  if (millis() - timer >= 2000) {
    y = random(height);
    timer = millis();
  }

  // use frameCount and noise to change the red color component
  r = noise(frameCount * 0.01) * 255;

  // use frameCount and modulo to change the green color component
  g = frameCount % 255;

  // use frameCount and noise to change the blue color component
  b = 255 - noise(1 + frameCount * 0.025) * 255;

  // use frameCount and noise to change the radius
  radius = noise(frameCount * 0.01) * 100;

  color c = color(r, g, b);
  fill(c);
  ellipse(x, y, radius, radius);
}

