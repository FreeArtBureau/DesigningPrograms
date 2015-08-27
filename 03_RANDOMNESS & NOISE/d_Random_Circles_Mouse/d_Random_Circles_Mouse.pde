/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/



/////////////////////////// GLOBALS ////////////////////////////
int posX, posY;
int distance;
int dia;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(700, 400);
  frameRate(10);
  background(0);
  smooth();
  noFill();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  ellipse(posX, posY, dia, dia);
  
  // dia+=distance/5; > c'est une manière plus simple d'écrire :
  // dia = dia + distance/5;
  dia+=distance/5;
}

/////////////////////////// FUNCTIONS ////////////////////////////
void mousePressed() {
  stroke(255);
  dia = (int)random(1, 10);
  distance = int(random(10, 80));
  posX = mouseX;
  posY = mouseY;
}

void keyPressed() {
  if (key == DELETE || key == BACKSPACE) {
    background(0);
    dia = 0;
  }
  if (key == 's') {
    save("monImage_####.tiff");
  }
}

