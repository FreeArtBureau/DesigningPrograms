/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */


/////////////////////////// GLOBALS ////////////////////////////
ArrayList <Box> boxes;
float angleBoxSize;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(255);
  smooth();
  boxes = new ArrayList();
  angleBoxSize = radians(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);

  if (mousePressed) {
    float boxSize = sin(angleBoxSize*0.3) * 15;
    Box b = new Box(mouseX, mouseY, boxSize);
    boxes.add(b);
  }
  for (Box b : boxes) {
    b.render(); 
    b.move();
  }
  angleBoxSize+=0.3;
}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed() { 
  if (key == 'g') {
    //boxes.get(2);
    boxes.clear(); // Clears all elements from the Array List.
    // println(
  }
  if (key == 'a') {
    int s = boxes.size();
    println(s);
  }
}

