/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */
/////////////////////////// GLOBALS ////////////////////////////
import processing.pdf.*;
// Here we declare an ArrayList of data type Agent (our class)
ArrayList <Agent> AgentsCollection;
PImage a;
//int _THRESH_MAX = 173; // modifies black pixels threshold
float strokeW;
/////////////////////////// SETUP ////////////////////////////

void setup() {

  background(0);
  smooth();
  // use 8bit png grayscale image with transparecy & without dither
  a = loadImage("cloud.jpg");
  size(a.width, a.height);
  // Initialise our ArrayList (it is empty to begin with & has no fixed size)
  AgentsCollection = new ArrayList<Agent>();

  // Create a grid for diplaying each object ( myAgent )
  for (float y=10; y<height-10; y+=5) {
    for (float x=10; x<width-10; x+=5) {
      // Initialise each object with the constructor
      Agent myAgent = new Agent(x, y, 3);
      // Add each object to the ArrayList
      AgentsCollection.add(myAgent);
    }
  }
  strokeW = 1.0;
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(255);
  randomSeed(10000);

  // This syntax for what is basically a for loop
  // is called an enhanced for-loop
  // specially cooked for arrays & collections (ArrayLists)
  // for (type item : array ) * the type must be of the same type as the collection
  // READS as such :
  // "For each Agent ag in AgentsCollection...do something
  /*
  
   The loop executes once for each element in the array, 
   with the element's value copied into the declared variable. 
   The for-each loop is handy to transverse all the elements 
   of an array or a collection. It requires fewer lines of codes, 
   eliminates the loop counter and the array index, and is easier to read.
   However, for array of primitive types (e.g., array of ints), 
   it can read the elements only, and cannot modify the array's contents.
   This is because each element's value is copied into the loop's 
   variable (pass-by-value), instead of working on its original copy.
   */
  for (Agent ag : AgentsCollection) {
    float s = map(mouseX, 0, width, 1, 25);
    float n = map(mouseY, 0, height, 0.001, 0.010);
    ag.W = strokeW;
    ag.dia = s*0.1;
    ag.len = s;

    //ag.displayDots();
    ag.displayLines((int)s*10);
    ag.displayJOY(n, s/2);

    if (mousePressed) {
      ag.motion(mouseX);
    }
  }
}

/////////////////////////// FUNCTIONS ////////////////////////////



void keyPressed() { 
  if (key == 'g') {
    //  AgentsCollection.get(2);
    AgentsCollection.clear(); // Clears all elements from the Array List.
    // println(
  }
  if (key == 'a') {
    int s = AgentsCollection.size();
    println(s);
  }

  if (key == 'r') {
    setup();
    println("Init");
  }

  if (key == 's') {
    saveFrame("screenCapture_###.png");
  }

  if (key == 'b') {
    beginRecord(PDF, "Export_###.pdf");
  }

  if (key == 'e') {
    endRecord(); 
    println("DONE");
  }

  if (key == '+') {
    strokeW+=0.5;
  }

  if (key == '-') {
    strokeW-=0.5;
  }
}

