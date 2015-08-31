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
    float normX = mouseX/(float)width; // Valeurs entre 0.0 > 1.0
    println(normX);
    
    ellipse(mouseX,50,75,75);                   // Normal
    ellipse(pow(normX,4)*width,150,75,75);      // Décalage non-linéaire
    ellipse(pow(normX,8)*width,250,75,75);      // Décalage non-linéaire
    ellipse(width-mouseX,350,75,75);            // Inverse

}

/////////////////////////// FUNCTIONS ////////////////////////////

