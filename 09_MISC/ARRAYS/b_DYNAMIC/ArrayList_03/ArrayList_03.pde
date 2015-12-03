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
  rectMode(CENTER);
  boxes = new ArrayList();
  angleBoxSize = radians(0);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);

  if (mousePressed) {
    float boxSize = noise(frameCount*0.7) * 35;
    Box b = new Box(mouseX, mouseY, boxSize);
    boxes.add(b);
  }

  float nAmm = map(mouseX, 0, width, 0.0, 1.0);
  float boxS = map(mouseY, 0, height, 0.0, 30);

  for (Box b : boxes) {
    b.render(boxS); 
    //float offSet = random(0.1);
    //b.move();
    b.move2(nAmm);
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



