void setup() {
  
  size(640,420);
  smooth();
  background(0);
}

void draw() {
  // Une structure conditionnelle qui dit :
  // si nous appuyons sur la souris, exécuter
  // les instructions entre les deux accolades
  if (mousePressed) {
    fill(255);
    ellipse(mouseX,mouseY,50,50);
  }
}

/*
NOTES:

mouseX & mouseY sont des variables propres à Processing
et qui stocke la position en x & y de la souris 

*/
