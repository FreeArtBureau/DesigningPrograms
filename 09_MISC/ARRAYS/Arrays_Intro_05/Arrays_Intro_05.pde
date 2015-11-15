/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////

int num = 10;
float[] RandomTable;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 360);
  background(255);
  smooth();
  noStroke(); 
 rectMode(CENTER); 
  RandomTable = new float[num];
  
  for (int i=0; i<RandomTable.length; i++) {
    // RandomTable[i] = random(1); //Random numbers between 0 & 1
    RandomTable[i] = int(random(10, 340)); 

  }
  println (RandomTable.length + " Elements:");
  println (RandomTable);
      int x = 50;
  for (int i=0; i < RandomTable.length; i++) {
    fill(RandomTable[i]/2, RandomTable[i]/2, RandomTable[i]/2);

      ellipse(x, 25, 5, 5);
      rect(x, 400, 25, -RandomTable[i]);
      x+=50;
  }
}

