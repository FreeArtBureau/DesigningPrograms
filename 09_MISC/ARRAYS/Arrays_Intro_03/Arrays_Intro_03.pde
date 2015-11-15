/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */
 
/////////////////////////// GLOBALS ////////////////////////////

int[] data = new int[4]; // Déclare & crée notre tableau pour 4 éléments
/////////////////////////// SETUP ////////////////////////////
void setup() {
  size (400, 200); 
  background (255);
  noStroke();
  fill(255,0,0,150);
  smooth();
  for(int i=0; i<data.length; i++) {
    // Attribue 4 valeurs de manière aléatoire à notre tableau
    data[i] = (int)random(width);
   ellipse(data[i], 100,50,50); 
  }
  
}


/////////////////////////// DRAW ////////////////////////////

void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
 setup(); 
}
