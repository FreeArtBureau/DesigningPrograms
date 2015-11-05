/**
 * Cheese & Moiré_03
 * The class for making graphic cheeses ;–) 
 * 
 * In this new version, a class !
 * 
 * MW 23.10.2015
 *
 * REF : 
 *
 */

/////////////////////////// GLOBALS ////////////////////////////
Cheese myCheese;
Cheese myCheese2;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  colorMode(HSB, 360, 100, 100);
  background(1, 100, 0);
  size(500, 500);
  smooth();
  // @params: x & y postions, number of cheese slices, gap, diameter size, rotate, refine
  // gap argument refers to the gap between each arc's edge.
  myCheese = new Cheese(150, 150, 8, 1.1, 200, true, 0.005);
  myCheese2 = new Cheese(300, 250, 73, 4.3, 170, true, 0.10);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(1, 100, 0);

  myCheese.draw();

  myCheese2.draw();
  myCheese2.animate_01(300); // @param maximum diameter
}

/////////////////////////// FUNCTIONS ////////////////////////////

