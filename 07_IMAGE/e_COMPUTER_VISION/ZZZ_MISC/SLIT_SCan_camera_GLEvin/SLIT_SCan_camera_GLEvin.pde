// For Processing Version 1.01.
// Written by Golan Levin : http://www.flong.com/
import processing.video.*;
Capture cam;
int X=0;
void setup() {
  cam = new Capture (this, 320, 240);
  size(600, 240);
  cam.start();
}
void draw() {
  if (cam.available()) {
    cam.read();
    // READ : http://processing.org/reference/PImage_copy_.html
    // pimg.copy(src, sx, sy, sw, sh, dx, dy, dw, dh)
    //copy(cam, (cam.width/2), 0, 1, cam.height, (X++%width), 0, 1, height);
    copy(cam, cam.width/2, 0, 1, cam.height, (X++ % width), 0, 1, height);

  }
}

