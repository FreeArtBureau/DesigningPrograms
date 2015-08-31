/*
INTERACTION MOUSE_01

*/

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
    background(0);
    ellipse(mouseX,50,75,75);         // Normal
    ellipse(mouseX+50,150,75,75);     // Décalage
    ellipse(mouseX*2,250,75,75);      // Décalage à l'échelle
    ellipse(width-mouseX,350,75,75);  // Inverse

}

/////////////////////////// FUNCTIONS ////////////////////////////

