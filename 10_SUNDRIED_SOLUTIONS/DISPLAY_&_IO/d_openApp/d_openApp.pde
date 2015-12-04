/*
 * OpenApp
 * Opens another application on the computer 
 *
 * MW 3.11.15
 *
 * end
 
 */


void setup() {
  size(200, 200);
}

void draw() {
}


void mouseDragged() {
  ellipse(mouseX, mouseY, 10, 10);
}

void mouseReleased() {
  save("file.jpg");
  open("/Applications/TextEdit.app");
  background(50);
}

