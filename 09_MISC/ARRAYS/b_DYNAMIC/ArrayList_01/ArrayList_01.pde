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
  background(0);
  smooth();
  rectMode(CENTER);
  boxes = new ArrayList();
  angleBoxSize = radians(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);


  for (Box b : boxes) {
    b.render(); 
    b.move();
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void mousePressed() {
  float boxSize = random(15, 50);
  Box b = new Box(mouseX, mouseY, boxSize);
  boxes.add(b);
}

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



