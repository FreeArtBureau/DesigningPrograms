/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////
import java.util.*;
ArrayList <Box> myBoxes;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 430);
  background(0);
  smooth();
  rectMode(CENTER);
  myBoxes = new ArrayList<Box>();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  Box b;
  //This Iterator keeps tracks of my objects created in the ArrayList.
  Iterator<Box> it = myBoxes.iterator();

  while (it.hasNext ()) { // hasNext() returns true as long as the collection has elements
    b=it.next(); // returns the next element in the iteration
    b.timer();
    b.move();
    b.render();

    //Our class has a built in timer with a maxValue
    //Once this value has been attained we remove our 
    //last object using the iterator's remove() method.
    if (b.death) {
      it.remove();
      println("removing box, nb="+myBoxes.size());
      println(b.toString());
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////
void mousePressed() {
  int size = (int)random(15, 73);
  float sp = random(0.05, 0.9);
  myBoxes.add(new Box(mouseX, mouseY, size, sp));
}

void keyPressed() { 
  if (key == 'g') {
    //boxes.get(2);
    myBoxes.clear(); // Clears all elements from the Array List.
    // println(
  }
  if (key == 'a') {
    int s = myBoxes.size();
    println(s);
  }
}


