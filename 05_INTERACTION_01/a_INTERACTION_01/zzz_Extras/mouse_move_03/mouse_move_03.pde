/*
INTERACTION MOUSE_MOVE_03

*/

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  stroke(255);
  strokeWeight(10);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
    background(0);
    // La fonction map() permet d'appliquer une plage de valeurs à une autre
    // Ici on applique la largeur de notre fenêtre à un tour complet de la ligne.
    float angle = map(mouseX, 0, width, 0, radians(360)); 
    println(angle);
    
    translate(width/2,height/2); // Dessiner au centre
    rotate(angle);
    
    float lineLength = map(mouseY, 0, height, 1, 100);
    line(-lineLength,-lineLength,lineLength,lineLength);

}

/////////////////////////// FUNCTIONS ////////////////////////////

