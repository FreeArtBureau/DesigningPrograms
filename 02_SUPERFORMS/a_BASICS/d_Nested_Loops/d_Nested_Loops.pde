/* 
 --------------------------
 ** PLEASE READ INFO TAB **
 --------------------------
 
 */

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 450);
  background(255);
  smooth();
  noStroke();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);


  for (int y = 50; y<height-50; y+=10) {       
    for (int x = 50; x<width-50; x+=10) {        
      fill(0);
      ellipse( x, y, 5, 5);
    }
  }



  // Here is the same visual effect but using a nested while Loop
  // Note how many more lines of code are needed. It becomes complicated !
  /*
  int x = 50; 
   while (x<width-50) {
   
   int y = 50;
   while (y<height-50) {
   
   // Draw circles 
   fill(255, 0, 0); 
   ellipse(x, y, 5, 5);
   
   y+=10;
   }
   x+=10;
   }
   */
}




/////////////////////////// FUNCTIONS ////////////////////////////

