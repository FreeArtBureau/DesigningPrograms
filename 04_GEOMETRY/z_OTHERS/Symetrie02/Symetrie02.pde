import processing.pdf.*;
float angle_pas = 30;

void setup() {
  size(400, 600);
  smooth();
  background(0);
  fill(255);
  noStroke();
  beginRecord(PDF, "export_###.pdf");
}



void draw() {
  translate(width/2, height/2);

  if (mousePressed) {
    for (float a=0; a<360; a+=angle_pas) {
      // line(pmouseX-width/2,pmouseY-height/2,mouseX-width/2,mouseY-height/2);
      ellipse(mouseX-width/2, mouseY-height/2, 2, 2);

      rotate(radians(angle_pas));
    }
  }
}

void keyPressed()
{
  endRecord();
}

